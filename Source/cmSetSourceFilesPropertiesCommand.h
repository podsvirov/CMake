/* Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
   file Copyright.txt or https://cmake.org/licensing for details.  */
#ifndef cmSetSourceFilesPropertiesCommand_h
#define cmSetSourceFilesPropertiesCommand_h

#include "cmConfigure.h" // IWYU pragma: keep

#include <string>
#include <vector>

#include "cm_memory.hxx"

#include "cmCommand.h"

class cmExecutionStatus;
class cmMakefile;

class cmSetSourceFilesPropertiesCommand : public cmCommand
{
public:
  std::unique_ptr<cmCommand> Clone() override
  {
    return cm::make_unique<cmSetSourceFilesPropertiesCommand>();
  }

  /**
   * This is called when the command is first encountered in
   * the input file.
   */
  bool InitialPass(std::vector<std::string> const& args,
                   cmExecutionStatus& status) override;

  static bool RunCommand(cmMakefile* mf,
                         std::vector<std::string>::const_iterator filebeg,
                         std::vector<std::string>::const_iterator fileend,
                         std::vector<std::string>::const_iterator propbeg,
                         std::vector<std::string>::const_iterator propend,
                         std::string& errors);
};

#endif
