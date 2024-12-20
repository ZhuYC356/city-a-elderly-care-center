# 管理员表
create table admin
(
    id       int(10) auto_increment comment 'ID'
        primary key,
    username varchar(255) null comment '用户名',
    password varchar(255) null comment '密码',
    name     varchar(255) null comment '姓名',
    avatar   varchar(255) null comment '头像',
    phone    varchar(255) null comment '电话',
    email    varchar(255) null comment '邮箱',
    status   VARCHAR(50)  null comment '状态,用于删除,1 可用，0 不可用' default 1
)
    comment '管理员' collate = utf8mb4_unicode_ci
                     row_format = DYNAMIC;
# 通知表
create table notice
(
    id      int auto_increment comment 'ID'
        primary key,
    title   varchar(255) null comment '标题',
    content varchar(255) null comment '内容',
    time    varchar(255) null comment '创建时间',
    user    varchar(255) null comment '创建人',
    status  VARCHAR(50)  null comment '状态,用于删除,1 可用，0 不可用' default 1
)
    comment '公告信息表' collate = utf8mb4_unicode_ci
                         row_format = DYNAMIC;
-- 创建护工信息表
CREATE TABLE nurse_info
(
    nurse_id                 INT PRIMARY KEY AUTO_INCREMENT COMMENT '护工唯一标识符',
    name                     VARCHAR(50) NOT NULL COMMENT '护工姓名',
    gender                   CHAR(1)     NOT NULL COMMENT '护工性别（M/F）',
    age                      INT         NOT NULL COMMENT '护工年龄',
    contact_info             VARCHAR(50) COMMENT '护工联系方式',
    photo                    VARCHAR(255) COMMENT '护工照片',
    work_experience          TEXT COMMENT '工作经验描述',
    professional_certificate VARCHAR(255) COMMENT '专业证书',
    nurse_level              INT COMMENT '护理等级 1 最高级 ，2 高级，3 中级，4 低级',
    service_evaluation       TEXT COMMENT '服务评价',
    status                   VARCHAR(50) COMMENT '状态,用于删除,1 可用，0 不可用' default 1
) COMMENT ='存储护工基本信息';

-- 创建老人信息表
CREATE TABLE elderly_info
(
    elderly_id          INT PRIMARY KEY AUTO_INCREMENT COMMENT '老人唯一标识符',
    name                VARCHAR(50)        NOT NULL COMMENT '老人姓名',
    gender              CHAR(1)            NOT NULL COMMENT '老人性别（M/F）',
    age                 INT                NOT NULL COMMENT '老人年龄',
    id_number           VARCHAR(18) UNIQUE NOT NULL COMMENT '老人身份证号',
    self_care_status    int COMMENT '自理能力等级，1 不自理，2 部分自理，3 自行disabled',
    home_address        VARCHAR(255) COMMENT '老人家庭住址',
    contact_info        VARCHAR(50) COMMENT '老人联系方式',
    family_contact_info VARCHAR(255) COMMENT '家属联系方式',
    photo               VARCHAR(255) COMMENT '老人照片',
    medical_history     TEXT COMMENT '病史记录',
    allergy_history     TEXT COMMENT '过敏史记录',
    physical_condition  TEXT COMMENT '身体状况描述',
    bed_id              INT COMMENT '关联床位信息表的外键',
    nurse_id            INT COMMENT '关联护工信息表的外键'                        default null,
    check_in_time       DATETIME COMMENT '入住时间',
    check_out_time      DATETIME COMMENT '离开时间',
    nurse_level         INT COMMENT '护理等级 1 最高级 ，2 高级，3 中级，4 低级',
    status              VARCHAR(50) COMMENT '入住状态,用于删除,1 已入住，0 已离开' default 1
) COMMENT ='存储老人详细信息';
-- 创建床位信息表
CREATE TABLE bed_info
(
    bed_id       INT PRIMARY KEY AUTO_INCREMENT COMMENT '床位唯一标识符',
    bed_number   VARCHAR(50) NOT NULL COMMENT '床位号',
    bed_type     VARCHAR(50) NOT NULL COMMENT '床位类型',
    bed_status   CHAR(1)     NOT NULL COMMENT '床位状态（O/C/R：空闲/占用/预留）',
    floor_number INT COMMENT '楼号',
    room_number  VARCHAR(50) COMMENT '房间号',
    floor        INT COMMENT '楼层',
    status       VARCHAR(50) COMMENT '状态,用于删除,1 可用，0 不可用' default 1
) COMMENT ='存储床位基本信息';
# 护理项目表
CREATE TABLE care_project
(
    project_id       INT PRIMARY KEY AUTO_INCREMENT COMMENT '护理项目唯一标识符',
    project_name     VARCHAR(100)   NOT NULL COMMENT '护理项目名称',
    description      TEXT COMMENT '护理项目描述',
    service_duration TIME COMMENT '服务时长',
    price            DECIMAL(10, 2) NOT NULL COMMENT '服务价格',
    frequency        CHAR(1) COMMENT '服务频率（如D表示每天，W表示每周，M表示每月等）',
    nurse_level      INT COMMENT '护理等级 1 最高级 ，2 高级，3 中级，4 低级',
    is_active        TINYINT(1)     NOT NULL                             DEFAULT 1 COMMENT '是否有效（1表示有效，0表示无效）',
    created_at       TIMESTAMP                                           DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at       TIMESTAMP                                           DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    status           VARCHAR(50) COMMENT '状态,用于删除,1 可用，0 不可用' default 1
) COMMENT ='存储护理项目信息';
-- 创建存储退住请求的表
CREATE TABLE check_out_requests
(
    request_id       INT AUTO_INCREMENT PRIMARY KEY COMMENT '退住请求的唯一标识符',
    elderly_id       VARCHAR(255) NOT NULL COMMENT '客户的唯一ID（例如，老年人的ID）',
    bed_id           VARCHAR(50) COMMENT '外联床位id',
    phone_number     VARCHAR(50)  NOT NULL COMMENT '客户的联系电话',
    property_address VARCHAR(255) COMMENT '住所地址（可能不是必需的，取决于您的设计）',
    check_in_date    DATE COMMENT '入住日期',
    check_out_date   DATE COMMENT '计划退住日期（实际退住日期可能有所不同）',
    checkout_reason  TEXT COMMENT '退住原因（可选的详细描述）',
    checkout_type    INT          NOT NULL COMMENT '退住类型：1-正常退住, 2-死亡退住, 3-保留床位（注意：这里我修改了原始设计中的值以避免重复，因为您原始设计中死亡退住和保留床位都是2）',
    approval_status  INT       DEFAULT 1 COMMENT '审核状态：1-未审核, 2-通过, 3-不通过',
    approval_time    DATETIME     NULL COMMENT '审批时间（仅当审核通过时设置）',
    approval_person  VARCHAR(255) NULL COMMENT '审批人（仅当审核通过时设置）',
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录最后更新时间'
);
# 护理记录表
CREATE TABLE care_record
(
    care_record_id  INT PRIMARY KEY AUTO_INCREMENT COMMENT '护理记录的唯一标识符',
    elderly_id      INT           NOT NULL COMMENT '与该护理记录关联的老人ID，外键关联到老人表',
    care_project_id INT           NOT NULL COMMENT '与该护理记录关联的护理项目ID，外键关联到护理项目表',
    care_date       DATE          NOT NULL COMMENT '护理发生的日期',
    care_type       VARCHAR(100)  NOT NULL COMMENT '护理的类型或名称',
    care_duration   TIME          NOT NULL COMMENT '护理的持续时间',
    caregiver_id    INT           NOT NULL COMMENT '执行护理的护理人员的ID，外键关联到护理人员表',
    temperature     DECIMAL(5, 2) NULL COMMENT '老人护理时的体温记录',
    blood_pressure  VARCHAR(10)   NULL COMMENT '老人护理时的血压记录',
    blood_sugar     DECIMAL(5, 2) NULL COMMENT '老人护理时的血糖记录',
    other_signs     TEXT          NULL COMMENT '其他需要记录的生命体征信息',
    remarks         TEXT          NULL COMMENT '护理过程中的备注信息或特殊事件记录',
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '记录被添加到表中的时间',
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录最后一次被修改的时间',
    status          int       default 1 COMMENT '状态,用于删除,1 可用，0 不可用'
) COMMENT ='存储老人的护理记录信息';
-- 创建老人项目关联表
CREATE TABLE elderly_care_project
(
    association_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '关联唯一标识符',
    elderly_id     INT  NOT NULL COMMENT '老人唯一标识符，外键指向elderly表',
    project_id     INT  NOT NULL COMMENT '护理项目唯一标识符，外键指向care_project表',
    start_date     DATE NOT NULL COMMENT '开始日期',
    end_date       DATE NULL COMMENT '结束日期（如果项目仍在进行中，则为NULL）',
    remarks        TEXT NULL COMMENT '备注',
    created_at     TIMESTAMP                                           DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at     TIMESTAMP                                           DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
    status         VARCHAR(50) COMMENT '状态,用于删除,1 可用，0 不可用' default 1
) COMMENT ='存储老人与护理项目的关联信息';
-- 创建床位和老人的关联表
CREATE TABLE bed_elderly_association
(
    association_id       INT PRIMARY KEY AUTO_INCREMENT COMMENT '关联记录的唯一标识符',
    bed_id               INT      NOT NULL COMMENT '与该关联记录关联的床位ID，外键关联到床位表',
    elderly_id           INT      NOT NULL COMMENT '与该关联记录关联的老人ID，外键关联到老人表',
    check_in_date        DATE     NOT NULL COMMENT '老人入住床位的日期',
    bed_status           INT      NOT NULL DEFAULT '0' COMMENT '指示老人当前是否在床位上 0 在床 1 离床',
    leave_bed_start_time DATETIME NULL COMMENT '如果老人离床，记录其离床的开始时间',
    leave_bed_end_time   DATETIME NULL COMMENT '如果老人返回床位，记录其返回的时间',
    remarks              TEXT     NULL COMMENT '关于床位与老人关联的额外信息或备注',
    created_at           TIMESTAMP         DEFAULT CURRENT_TIMESTAMP COMMENT '记录被添加到表中的时间',
    updated_at           TIMESTAMP         DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录最后一次被修改的时间'
) COMMENT ='存储疗养院床位与老人之间的关联信息';
# 外出登记表
CREATE TABLE outing_registration
(
    outing_id           INT PRIMARY KEY AUTO_INCREMENT COMMENT '外出记录的唯一标识符',
    elderly_id          INT          NOT NULL COMMENT '外出老人的唯一标识符，外键关联到老人表',
    outing_date         DATE         NOT NULL COMMENT '外出的日期',
    outing_time         TIME         NOT NULL COMMENT '外出的具体时间',
    destination         VARCHAR(255) NOT NULL COMMENT '外出的目的地描述',
    purpose             TEXT         NOT NULL COMMENT '外出的目的或活动描述',
    accompanying_person VARCHAR(255) NULL COMMENT '陪同老人的人员姓名或身份描述',
    contact_info        VARCHAR(100) NULL COMMENT '外出时可用于联系的电话号码',
    remarks             TEXT         NULL COMMENT '其他需要记录的备注信息',
    created_at          TIMESTAMP                                           DEFAULT CURRENT_TIMESTAMP COMMENT '记录被添加到表中的时间',
    updated_at          TIMESTAMP                                           DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录最后一次被修改的时间',
    review_status       int                                                 default 0 COMMENT '审核状态，默认为0（未审核） 1表示已审核，-1表示审核未通过',
    status              VARCHAR(50) COMMENT '状态,用于删除,1 可用，0 不可用' default 1
) COMMENT ='存储老人外出登记信息';
# 财务表
CREATE TABLE financial
(
    financial_id   INT PRIMARY KEY AUTO_INCREMENT COMMENT '财务记录的唯一标识符',
    type           VARCHAR(50)    NOT NULL COMMENT '财务记录的类型（收入、支出等）',
    amount         DECIMAL(15, 2) NOT NULL COMMENT '财务记录的金额',
    date           DATE           NOT NULL COMMENT '财务记录发生的日期',
    elderly_id     INT            NULL COMMENT '与该财务记录关联的老人ID，外键关联到老人表',
    project_id     INT            NULL COMMENT '与该财务记录关联的护理项目ID，外键关联到护理项目表',
    invoice_number VARCHAR(255)   NULL COMMENT '与该财务记录关联的发票编号',
    invoice_date   DATE           NULL COMMENT '发票的日期',
    payment_party  VARCHAR(255)   NOT NULL COMMENT '付款或收款方的名称或描述',
    remarks        TEXT           NULL COMMENT '其他需要记录的备注信息',
    created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '记录被添加到表中的时间',
    updated_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录最后一次被修改的时间',
    status         int       default 1 COMMENT '状态,用于删除,1 可用，0 不可用'
) COMMENT ='存储老人项目的财务信息';
