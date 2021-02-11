Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2490318865
	for <lists+linux-input@lfdr.de>; Thu, 11 Feb 2021 11:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbhBKKlp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Feb 2021 05:41:45 -0500
Received: from mga04.intel.com ([192.55.52.120]:44626 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230374AbhBKKja (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Feb 2021 05:39:30 -0500
IronPort-SDR: 1N4ZsyKIzdXm0h7vdMy0ruYVpgNhnfC5yUTiuBqKeNSRdwzF7KNQUM1k9ae7f5j5HI1kQWUCr+
 TyTebR/gJetg==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="179663252"
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; 
   d="gz'50?scan'50,208,50";a="179663252"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2021 02:37:10 -0800
IronPort-SDR: Ohk6Y8fne2+uhbJCYmGn5tP2lNtggZmM69FPaEJcqVCDY1lB8fBmAhwBjAasuibg491qm7Q+Gv
 tUzuyRkHGrVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; 
   d="gz'50?scan'50,208,50";a="359959746"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 11 Feb 2021 02:37:07 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lA9LO-0003hX-Rt; Thu, 11 Feb 2021 10:37:06 +0000
Date:   Thu, 11 Feb 2021 18:36:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hamza Farooq <0xa6c4@gmail.com>, dmitry.torokhov@gmail.com
Cc:     kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: psmouse - add support for FocalTech PS/2 Protocol
 v2
Message-ID: <202102111817.sPo0m4ak-lkp@intel.com>
References: <20210210233926.GA3348@Hamzas-MacBook>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline
In-Reply-To: <20210210233926.GA3348@Hamzas-MacBook>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hamza,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on input/next]
[also build test ERROR on linux/master hid/for-next linus/master v5.11-rc7 next-20210125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Hamza-Farooq/Input-psmouse-add-support-for-FocalTech-PS-2-Protocol-v2/20210211-074527
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
config: parisc-randconfig-r004-20210211 (attached as .config)
compiler: hppa-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/958fb71223bb82ea01edbcbf4970af1d888b1050
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hamza-Farooq/Input-psmouse-add-support-for-FocalTech-PS-2-Protocol-v2/20210211-074527
        git checkout 958fb71223bb82ea01edbcbf4970af1d888b1050
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=parisc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:22,
                    from include/linux/bitops.h:5,
                    from drivers/input/mouse/psmouse-base.c:13:
   drivers/input/mouse/psmouse-base.c: In function 'psmouse_extensions':
>> drivers/input/mouse/psmouse-base.c:1089:24: error: 'focaltech_v2_detect' undeclared (first use in this function); did you mean 'focaltech_detect'?
    1089 |  if (psmouse_do_detect(focaltech_v2_detect,
         |                        ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/input/mouse/psmouse-base.c:1089:2: note: in expansion of macro 'if'
    1089 |  if (psmouse_do_detect(focaltech_v2_detect,
         |  ^~
   drivers/input/mouse/psmouse-base.c:1089:24: note: each undeclared identifier is reported only once for each function it appears in
    1089 |  if (psmouse_do_detect(focaltech_v2_detect,
         |                        ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/input/mouse/psmouse-base.c:1089:2: note: in expansion of macro 'if'
    1089 |  if (psmouse_do_detect(focaltech_v2_detect,
         |  ^~
--
>> drivers/input/mouse/focaltech_v2.c:27:5: warning: no previous prototype for 'focaltech_v2_detect' [-Wmissing-prototypes]
      27 | int focaltech_v2_detect(struct psmouse *psmouse, bool set_properties)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/input/mouse/focaltech_v2.c:17:33: warning: 'switch_protocol' defined but not used [-Wunused-const-variable=]
      17 | static const struct fte_command switch_protocol[] = {
         |                                 ^~~~~~~~~~~~~~~


vim +1089 drivers/input/mouse/psmouse-base.c

  1052	
  1053	/*
  1054	 * psmouse_extensions() probes for any extensions to the basic PS/2 protocol
  1055	 * the mouse may have.
  1056	 */
  1057	static int psmouse_extensions(struct psmouse *psmouse,
  1058				      unsigned int max_proto, bool set_properties)
  1059	{
  1060		bool synaptics_hardware = false;
  1061		int ret;
  1062	
  1063		/*
  1064		 * Always check for focaltech, this is safe as it uses pnp-id
  1065		 * matching.
  1066		 */
  1067		if (psmouse_do_detect(focaltech_detect,
  1068				      psmouse, false, set_properties)) {
  1069			if (max_proto > PSMOUSE_IMEX &&
  1070			    IS_ENABLED(CONFIG_MOUSE_PS2_FOCALTECH) &&
  1071			    (!set_properties || focaltech_init(psmouse) == 0)) {
  1072				return PSMOUSE_FOCALTECH;
  1073			}
  1074			/*
  1075			 * Restrict psmouse_max_proto so that psmouse_initialize()
  1076			 * does not try to reset rate and resolution, because even
  1077			 * that upsets the device.
  1078			 * This also causes us to basically fall through to basic
  1079			 * protocol detection, where we fully reset the mouse,
  1080			 * and set it up as bare PS/2 protocol device.
  1081			 */
  1082			psmouse_max_proto = max_proto = PSMOUSE_PS2;
  1083		}
  1084	
  1085		/*
  1086		 * Always check for focaltech-v2, this is safe as it uses pnp-id
  1087		 * matching.
  1088		 */
> 1089		if (psmouse_do_detect(focaltech_v2_detect,
  1090				      psmouse, false, set_properties)) {
  1091			if (max_proto > PSMOUSE_IMEX &&
  1092			    IS_ENABLED(CONFIG_MOUSE_PS2_FOCALTECH_V2) &&
  1093			    (!set_properties || focaltech_v2_init(psmouse) == 0)) {
  1094				return PSMOUSE_FOCALTECH_V2;
  1095			}
  1096			/*
  1097			 * Restrict psmouse_max_proto so that psmouse_initialize()
  1098			 * does not try to reset rate and resolution, because even
  1099			 * that upsets the device.
  1100			 * This also causes us to basically fall through to basic
  1101			 * protocol detection, where we fully reset the mouse,
  1102			 * and set it up as bare PS/2 protocol device.
  1103			 */
  1104			psmouse_max_proto = max_proto = PSMOUSE_PS2;
  1105		}
  1106	
  1107		/*
  1108		 * We always check for LifeBook because it does not disturb mouse
  1109		 * (it only checks DMI information).
  1110		 */
  1111		if (psmouse_try_protocol(psmouse, PSMOUSE_LIFEBOOK, &max_proto,
  1112					 set_properties, max_proto > PSMOUSE_IMEX))
  1113			return PSMOUSE_LIFEBOOK;
  1114	
  1115		if (psmouse_try_protocol(psmouse, PSMOUSE_VMMOUSE, &max_proto,
  1116					 set_properties, max_proto > PSMOUSE_IMEX))
  1117			return PSMOUSE_VMMOUSE;
  1118	
  1119		/*
  1120		 * Try Kensington ThinkingMouse (we try first, because Synaptics
  1121		 * probe upsets the ThinkingMouse).
  1122		 */
  1123		if (max_proto > PSMOUSE_IMEX &&
  1124		    psmouse_try_protocol(psmouse, PSMOUSE_THINKPS, &max_proto,
  1125					 set_properties, true)) {
  1126			return PSMOUSE_THINKPS;
  1127		}
  1128	
  1129		/*
  1130		 * Try Synaptics TouchPad. Note that probing is done even if
  1131		 * Synaptics protocol support is disabled in config - we need to
  1132		 * know if it is Synaptics so we can reset it properly after
  1133		 * probing for IntelliMouse.
  1134		 */
  1135		if (max_proto > PSMOUSE_PS2 &&
  1136		    psmouse_do_detect(synaptics_detect,
  1137				      psmouse, false, set_properties)) {
  1138			synaptics_hardware = true;
  1139	
  1140			if (max_proto > PSMOUSE_IMEX) {
  1141				/*
  1142				 * Try activating protocol, but check if support is
  1143				 * enabled first, since we try detecting Synaptics
  1144				 * even when protocol is disabled.
  1145				 */
  1146				if (IS_ENABLED(CONFIG_MOUSE_PS2_SYNAPTICS) ||
  1147				    IS_ENABLED(CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS)) {
  1148					if (!set_properties)
  1149						return PSMOUSE_SYNAPTICS;
  1150	
  1151					ret = synaptics_init(psmouse);
  1152					if (ret >= 0)
  1153						return ret;
  1154				}
  1155	
  1156				/*
  1157				 * Some Synaptics touchpads can emulate extended
  1158				 * protocols (like IMPS/2).  Unfortunately
  1159				 * Logitech/Genius probes confuse some firmware
  1160				 * versions so we'll have to skip them.
  1161				 */
  1162				max_proto = PSMOUSE_IMEX;
  1163			}
  1164	
  1165			/*
  1166			 * Make sure that touchpad is in relative mode, gestures
  1167			 * (taps) are enabled.
  1168			 */
  1169			synaptics_reset(psmouse);
  1170		}
  1171	
  1172		/*
  1173		 * Try Cypress Trackpad. We must try it before Finger Sensing Pad
  1174		 * because Finger Sensing Pad probe upsets some modules of Cypress
  1175		 * Trackpads.
  1176		 */
  1177		if (max_proto > PSMOUSE_IMEX &&
  1178		    psmouse_try_protocol(psmouse, PSMOUSE_CYPRESS, &max_proto,
  1179					 set_properties, true)) {
  1180			return PSMOUSE_CYPRESS;
  1181		}
  1182	
  1183		/* Try ALPS TouchPad */
  1184		if (max_proto > PSMOUSE_IMEX) {
  1185			ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_RESET_DIS);
  1186			if (psmouse_try_protocol(psmouse, PSMOUSE_ALPS,
  1187						 &max_proto, set_properties, true))
  1188				return PSMOUSE_ALPS;
  1189		}
  1190	
  1191		/* Try OLPC HGPK touchpad */
  1192		if (max_proto > PSMOUSE_IMEX &&
  1193		    psmouse_try_protocol(psmouse, PSMOUSE_HGPK, &max_proto,
  1194					 set_properties, true)) {
  1195			return PSMOUSE_HGPK;
  1196		}
  1197	
  1198		/* Try Elantech touchpad */
  1199		if (max_proto > PSMOUSE_IMEX &&
  1200		    psmouse_try_protocol(psmouse, PSMOUSE_ELANTECH,
  1201					 &max_proto, set_properties, false)) {
  1202			if (!set_properties)
  1203				return PSMOUSE_ELANTECH;
  1204	
  1205			ret = elantech_init(psmouse);
  1206			if (ret >= 0)
  1207				return ret;
  1208		}
  1209	
  1210		if (max_proto > PSMOUSE_IMEX) {
  1211			if (psmouse_try_protocol(psmouse, PSMOUSE_GENPS,
  1212						 &max_proto, set_properties, true))
  1213				return PSMOUSE_GENPS;
  1214	
  1215			if (psmouse_try_protocol(psmouse, PSMOUSE_PS2PP,
  1216						 &max_proto, set_properties, true))
  1217				return PSMOUSE_PS2PP;
  1218	
  1219			if (psmouse_try_protocol(psmouse, PSMOUSE_TRACKPOINT,
  1220						 &max_proto, set_properties, true))
  1221				return PSMOUSE_TRACKPOINT;
  1222	
  1223			if (psmouse_try_protocol(psmouse, PSMOUSE_TOUCHKIT_PS2,
  1224						 &max_proto, set_properties, true))
  1225				return PSMOUSE_TOUCHKIT_PS2;
  1226		}
  1227	
  1228		/*
  1229		 * Try Finger Sensing Pad. We do it here because its probe upsets
  1230		 * Trackpoint devices (causing TP_READ_ID command to time out).
  1231		 */
  1232		if (max_proto > PSMOUSE_IMEX &&
  1233		    psmouse_try_protocol(psmouse, PSMOUSE_FSP,
  1234					 &max_proto, set_properties, true)) {
  1235			return PSMOUSE_FSP;
  1236		}
  1237	
  1238		/*
  1239		 * Reset to defaults in case the device got confused by extended
  1240		 * protocol probes. Note that we follow up with full reset because
  1241		 * some mice put themselves to sleep when they see PSMOUSE_RESET_DIS.
  1242		 */
  1243		ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_RESET_DIS);
  1244		psmouse_reset(psmouse);
  1245	
  1246		if (max_proto >= PSMOUSE_IMEX &&
  1247		    psmouse_try_protocol(psmouse, PSMOUSE_IMEX,
  1248					 &max_proto, set_properties, true)) {
  1249			return PSMOUSE_IMEX;
  1250		}
  1251	
  1252		if (max_proto >= PSMOUSE_IMPS &&
  1253		    psmouse_try_protocol(psmouse, PSMOUSE_IMPS,
  1254					 &max_proto, set_properties, true)) {
  1255			return PSMOUSE_IMPS;
  1256		}
  1257	
  1258		/*
  1259		 * Okay, all failed, we have a standard mouse here. The number of
  1260		 * the buttons is still a question, though. We assume 3.
  1261		 */
  1262		psmouse_try_protocol(psmouse, PSMOUSE_PS2,
  1263				     &max_proto, set_properties, true);
  1264	
  1265		if (synaptics_hardware) {
  1266			/*
  1267			 * We detected Synaptics hardware but it did not respond to
  1268			 * IMPS/2 probes.  We need to reset the touchpad because if
  1269			 * there is a track point on the pass through port it could
  1270			 * get disabled while probing for protocol extensions.
  1271			 */
  1272			psmouse_reset(psmouse);
  1273		}
  1274	
  1275		return PSMOUSE_PS2;
  1276	}
  1277	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--C7zPtVaVf+AK4Oqc
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--C7zPtVaVf+AK4Oqc--
