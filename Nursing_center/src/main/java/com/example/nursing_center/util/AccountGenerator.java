package com.example.nursing_center.util;

import java.util.Random;

public class AccountGenerator {
    private static final int ACCOUNT_LENGTH = 5;
    private static final Random RANDOM = new Random();

    public static String generateAccount() {
        // 获取当前时间的秒级时间戳
        long currentTimeMillis = System.currentTimeMillis();
        long currentTimeSeconds = currentTimeMillis / 1000; // 转换为秒

        // 生成一个随机数，范围在0到99999之间（但不包括99999，因为我们需要取模到五位数）
        int randomNum = RANDOM.nextInt(100000 - ACCOUNT_LENGTH) + ACCOUNT_LENGTH; // 这里+ACCOUNT_LENGTH是为了避免取模后得到0开头的数字，但这样做其实并不严谨，因为仍然有可能得到小于10000的数字（尽管概率很低）

        // 将时间戳和随机数结合起来（这里简单地将它们相加，但更好的做法可能是将它们拼接成一个字符串，然后再进行哈希或取模运算）
        // 然而，由于我们只需要五位数，我们直接对相加的结果取模
        int combined = (int) (currentTimeSeconds + randomNum) % 100000; // 取模到100000是为了避免负数，但实际上我们只需要五位数，所以这里有些浪费

        // 由于我们想要一个没有前导零的五位数（除非你愿意接受00001这样的账号），我们需要确保combined的值在10000到99999之间
        // 但是，由于上面的取模运算，我们得到的结果可能在0到99999之间，因此我们需要进行额外的检查
        // 如果combined小于10000，我们可以简单地重新生成一个随机数并重试（这不是最高效的方法，但在这种简单场景下应该是可行的）
        while (combined < 10000) {
            randomNum = RANDOM.nextInt(100000 - ACCOUNT_LENGTH) + ACCOUNT_LENGTH;
            combined = (int) ((currentTimeSeconds + randomNum) % 100000);
        }

        // 将结果格式化为五位数的字符串（尽管在这个例子中，由于我们已经确保了combined在10000到99999之间，这一步其实是多余的）
        String account = String.format("%05d", combined);

        return account;
    }
}