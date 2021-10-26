Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78C6243B330
	for <lists+linux-input@lfdr.de>; Tue, 26 Oct 2021 15:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236228AbhJZNeO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Oct 2021 09:34:14 -0400
Received: from mga03.intel.com ([134.134.136.65]:19283 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235293AbhJZNeN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 Oct 2021 09:34:13 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="229849323"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; 
   d="gz'50?scan'50,208,50";a="229849323"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2021 06:31:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; 
   d="gz'50?scan'50,208,50";a="635173934"
Received: from lkp-server01.sh.intel.com (HELO 9372cb945ed7) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 26 Oct 2021 06:31:23 -0700
Received: from kbuild by 9372cb945ed7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mfMXy-0000ZZ-OJ; Tue, 26 Oct 2021 13:31:22 +0000
Date:   Tue, 26 Oct 2021 21:30:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Alistair Francis <alistair@alistair23.me>, s.hauer@pengutronix.de,
        benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        shawnguo@kernel.org
Cc:     kbuild-all@lists.01.org, alistair23@gmail.com,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v13 1/3] HID: quirks: Allow inverting the absolute X/Y
 values
Message-ID: <202110262130.DNt5Ic8u-lkp@intel.com>
References: <20211025104605.36364-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline
In-Reply-To: <20211025104605.36364-1-alistair@alistair23.me>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alistair,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on hid/for-next]
[also build test WARNING on dtor-input/next robh/for-next v5.15-rc7 next-20211026]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alistair-Francis/HID-quirks-Allow-inverting-the-absolute-X-Y-values/20211025-184729
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
config: ia64-defconfig (attached as .config)
compiler: ia64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/ccc9b072f0233da9c215622b32ed61852df33627
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Alistair-Francis/HID-quirks-Allow-inverting-the-absolute-X-Y-values/20211025-184729
        git checkout ccc9b072f0233da9c215622b32ed61852df33627
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross ARCH=ia64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/hid/hid-input.c: In function 'hidinput_hid_event':
>> drivers/hid/hid-input.c:1333:49: warning: suggest parentheses around '&&' within '||' [-Wparentheses]
    1333 |                 ((*quirks & HID_QUIRK_X_INVERT) && usage->code == ABS_X ||


vim +1333 drivers/hid/hid-input.c

  1313	
  1314	void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct hid_usage *usage, __s32 value)
  1315	{
  1316		struct input_dev *input;
  1317		unsigned *quirks = &hid->quirks;
  1318	
  1319		if (!usage->type)
  1320			return;
  1321	
  1322		if (usage->type == EV_PWR) {
  1323			hidinput_update_battery(hid, value);
  1324			return;
  1325		}
  1326	
  1327		if (!field->hidinput)
  1328			return;
  1329	
  1330		input = field->hidinput->input;
  1331	
  1332		if (usage->type == EV_ABS &&
> 1333			((*quirks & HID_QUIRK_X_INVERT) && usage->code == ABS_X ||
  1334			 (*quirks & HID_QUIRK_Y_INVERT) && usage->code == ABS_Y)) {
  1335				value = field->logical_maximum - value;
  1336		}
  1337	
  1338		if (usage->hat_min < usage->hat_max || usage->hat_dir) {
  1339			int hat_dir = usage->hat_dir;
  1340			if (!hat_dir)
  1341				hat_dir = (value - usage->hat_min) * 8 / (usage->hat_max - usage->hat_min + 1) + 1;
  1342			if (hat_dir < 0 || hat_dir > 8) hat_dir = 0;
  1343			input_event(input, usage->type, usage->code    , hid_hat_to_axis[hat_dir].x);
  1344			input_event(input, usage->type, usage->code + 1, hid_hat_to_axis[hat_dir].y);
  1345			return;
  1346		}
  1347	
  1348		if (usage->hid == HID_DG_INVERT) {
  1349			*quirks = value ? (*quirks | HID_QUIRK_INVERT) : (*quirks & ~HID_QUIRK_INVERT);
  1350			return;
  1351		}
  1352	
  1353		if (usage->hid == HID_DG_INRANGE) {
  1354			if (value) {
  1355				input_event(input, usage->type, (*quirks & HID_QUIRK_INVERT) ? BTN_TOOL_RUBBER : usage->code, 1);
  1356				return;
  1357			}
  1358			input_event(input, usage->type, usage->code, 0);
  1359			input_event(input, usage->type, BTN_TOOL_RUBBER, 0);
  1360			return;
  1361		}
  1362	
  1363		if (usage->hid == HID_DG_TIPPRESSURE && (*quirks & HID_QUIRK_NOTOUCH)) {
  1364			int a = field->logical_minimum;
  1365			int b = field->logical_maximum;
  1366			input_event(input, EV_KEY, BTN_TOUCH, value > a + ((b - a) >> 3));
  1367		}
  1368	
  1369		if (usage->hid == (HID_UP_PID | 0x83UL)) { /* Simultaneous Effects Max */
  1370			dbg_hid("Maximum Effects - %d\n",value);
  1371			return;
  1372		}
  1373	
  1374		if (usage->hid == (HID_UP_PID | 0x7fUL)) {
  1375			dbg_hid("PID Pool Report\n");
  1376			return;
  1377		}
  1378	
  1379		if ((usage->type == EV_KEY) && (usage->code == 0)) /* Key 0 is "unassigned", not KEY_UNKNOWN */
  1380			return;
  1381	
  1382		if ((usage->type == EV_REL) && (usage->code == REL_WHEEL_HI_RES ||
  1383						usage->code == REL_HWHEEL_HI_RES)) {
  1384			hidinput_handle_scroll(usage, input, value);
  1385			return;
  1386		}
  1387	
  1388		if ((usage->type == EV_ABS) && (field->flags & HID_MAIN_ITEM_RELATIVE) &&
  1389				(usage->code == ABS_VOLUME)) {
  1390			int count = abs(value);
  1391			int direction = value > 0 ? KEY_VOLUMEUP : KEY_VOLUMEDOWN;
  1392			int i;
  1393	
  1394			for (i = 0; i < count; i++) {
  1395				input_event(input, EV_KEY, direction, 1);
  1396				input_sync(input);
  1397				input_event(input, EV_KEY, direction, 0);
  1398				input_sync(input);
  1399			}
  1400			return;
  1401		}
  1402	
  1403		/*
  1404		 * Ignore out-of-range values as per HID specification,
  1405		 * section 5.10 and 6.2.25, when NULL state bit is present.
  1406		 * When it's not, clamp the value to match Microsoft's input
  1407		 * driver as mentioned in "Required HID usages for digitizers":
  1408		 * https://msdn.microsoft.com/en-us/library/windows/hardware/dn672278(v=vs.85).asp
  1409		 *
  1410		 * The logical_minimum < logical_maximum check is done so that we
  1411		 * don't unintentionally discard values sent by devices which
  1412		 * don't specify logical min and max.
  1413		 */
  1414		if ((field->flags & HID_MAIN_ITEM_VARIABLE) &&
  1415		    (field->logical_minimum < field->logical_maximum)) {
  1416			if (field->flags & HID_MAIN_ITEM_NULL_STATE &&
  1417			    (value < field->logical_minimum ||
  1418			     value > field->logical_maximum)) {
  1419				dbg_hid("Ignoring out-of-range value %x\n", value);
  1420				return;
  1421			}
  1422			value = clamp(value,
  1423				      field->logical_minimum,
  1424				      field->logical_maximum);
  1425		}
  1426	
  1427		/*
  1428		 * Ignore reports for absolute data if the data didn't change. This is
  1429		 * not only an optimization but also fixes 'dead' key reports. Some
  1430		 * RollOver implementations for localized keys (like BACKSLASH/PIPE; HID
  1431		 * 0x31 and 0x32) report multiple keys, even though a localized keyboard
  1432		 * can only have one of them physically available. The 'dead' keys
  1433		 * report constant 0. As all map to the same keycode, they'd confuse
  1434		 * the input layer. If we filter the 'dead' keys on the HID level, we
  1435		 * skip the keycode translation and only forward real events.
  1436		 */
  1437		if (!(field->flags & (HID_MAIN_ITEM_RELATIVE |
  1438		                      HID_MAIN_ITEM_BUFFERED_BYTE)) &&
  1439				      (field->flags & HID_MAIN_ITEM_VARIABLE) &&
  1440		    usage->usage_index < field->maxusage &&
  1441		    value == field->value[usage->usage_index])
  1442			return;
  1443	
  1444		/* report the usage code as scancode if the key status has changed */
  1445		if (usage->type == EV_KEY &&
  1446		    (!test_bit(usage->code, input->key)) == value)
  1447			input_event(input, EV_MSC, MSC_SCAN, usage->hid);
  1448	
  1449		input_event(input, usage->type, usage->code, value);
  1450	
  1451		if ((field->flags & HID_MAIN_ITEM_RELATIVE) &&
  1452		    usage->type == EV_KEY && value) {
  1453			input_sync(input);
  1454			input_event(input, usage->type, usage->code, 0);
  1455		}
  1456	}
  1457	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--17pEHd4RhPHOinZp
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--17pEHd4RhPHOinZp--
