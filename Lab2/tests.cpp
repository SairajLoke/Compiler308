#include <gtest/gtest.h>
#include "check_identifier.cpp"

TEST(CheckId, PositiveNos) { 
    ASSERT_EQ(1, check_identifier("Sai"));
    ASSERT_EQ(0, check_identifier("break"));
    ASSERT_EQ(0, check_identifier("return"));
    ASSERT_EQ(1, check_identifier("Sai"));
}
 
// TEST(GCD, NegativeNos) {
//     ASSERT_EQ(-1, gcd(-5,8));
//     ASSERT_EQ(-1, gcd(-8,-5));
// }
 
int main(int argc, char **argv) {
    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}


