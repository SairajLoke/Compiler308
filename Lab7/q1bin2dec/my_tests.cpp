#include "gtest/gtest.h"
#include <iostream>
#include <fstream>
#include <sstream>
#include <stdexcept>

// Function to execute the binary with given arguments and capture its output
int executeBinary(const std::string& binaryPath,const std::vector<std::string>& args) {
    
    std::stringstream command;
    command << binaryPath;
    for (const auto& arg : args) {
        command << " " << arg;
    }

    std::string cmd_str =  "./a.out " +  command.str() +  " && echo $?" ;
    std::stringstream output_stream;
    output_stream << cmd_str;

    FILE* pipe = popen(output_stream.str().c_str(), "r");
    if (!pipe) throw std::runtime_error("popen() failed!");

    char buffer[128];
    std::string result;
    while (!feof(pipe)) {
        if (fgets(buffer, 128, pipe) != NULL)
            result += buffer;
    }

    int return_value = std::stoi(result);
    return return_value;

}

// Google Test fixture for black box testing
class BlackBoxTest : public ::testing::Test {
protected:
    virtual void SetUp() {
        // Set up any common resources needed for the tests
    }

    virtual void TearDown() {
        // Clean up any common resources used by the tests
    }
};


TEST_F(BlackBoxTest, Test2) {
    // Execute the binary with specific arguments
    ASSERT_EQ(executeBinary("a.out",{"1001"}),9);
    ASSERT_EQ(executeBinary("a.out",{"10"}), 2);
}
// Add more tests as needed

int main(int argc, char** argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
