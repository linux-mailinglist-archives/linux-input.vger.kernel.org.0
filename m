Return-Path: <linux-input+bounces-13958-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 410E7B241CA
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 08:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 835F23B93EE
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 06:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC6D1E7C1C;
	Wed, 13 Aug 2025 06:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bt0QKePS"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CBD2D373E
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 06:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755067481; cv=none; b=PLTl/F+5II0OGzC6iQaqUf8Aziq6ahOxzIFLDSw8akcDhTW67va4HCw2NklxQmR3BUj6FR1HD+rAWFFnXuDVc8t9O3evu92S28/qca58wd58nR1WFDPCm3rPWgwd/rSyiprn9EuE4dqCb5QebNqZ4WF+7i54y+RXZKkNjz743HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755067481; c=relaxed/simple;
	bh=cB4AoTU4EbRYOQ0kms4MtLPMue/MmRTLqWF6ULCF8IA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IvI1L2t9EYhrfJbQxZWsHOFZlaBpDEhx7nSqApBboEFPdwo7pQXau9ZdjCK4bDkf8Hb4IVZXRZBEf3+xXYKQgal/YPJqq/GYMP/VhOPFi/2Jmlb5jkJ1s6zOUhy+nCXGJzr6u1ouICEquwc8LLCjxYcwZAV0zYh5XCEceii58rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bt0QKePS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755067480; x=1786603480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cB4AoTU4EbRYOQ0kms4MtLPMue/MmRTLqWF6ULCF8IA=;
  b=Bt0QKePSNA2DHWdOXa3Glgg+tFxQyT6iwQxA6w6WXt4cVss8JMUQUMOw
   kAn+V5n0HoiueR9FErVnLtC6CyO1XFgsYlzHnNBQm2RskOZ3XH0VnR4OA
   IMxjkE20wXAM1El/dbpDRl9TYAnB7guQlNSuElbNF4Y4+SZik9HXhoEVl
   ZoS3dXYnwv0NiIC8ta1yU33AlAjm4zxNIT4Zgq4QHEUHTXEY530Hcjl2F
   gKlFfTzmouwnpIw8WrYBIoat1/p4qn0rPlC5e3lhx6x/MmihSGhz4dfwD
   0mdsnCt1UH3NgiC2nY2+ao5ln8/NSk9t6tCkE9TeL+A7VchxjjfLX/XJT
   g==;
X-CSE-ConnectionGUID: nXOJvR1oT9+TuMpHRBuWkA==
X-CSE-MsgGUID: ZRL2NoqMTF62AumYXhsjZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="79926278"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="79926278"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 23:44:37 -0700
X-CSE-ConnectionGUID: dX5TTtMDTsGjiFTd2mXnTg==
X-CSE-MsgGUID: 6NnE2E35SaGgBLkTlgPyUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="203573340"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 12 Aug 2025 23:44:34 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um5Ds-0009cQ-0f;
	Wed, 13 Aug 2025 06:44:32 +0000
Date: Wed, 13 Aug 2025 14:44:30 +0800
From: kernel test robot <lkp@intel.com>
To: Ping Cheng <pinglinux@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>
Subject: [hid:for-6.18/core 1/2] drivers/hid/hid-input.c:863:28: warning:
 this statement may fall through
Message-ID: <202508131442.PaMZ9pxz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-6.18/core
head:   eb5a60cc53d31f3f94537308147769363ad9fcb5
commit: f5013c67d914a4bd7ad403ac792056ae16d37e03 [1/2] HID: input: map HID_GD_Z to ABS_DISTANCE for stylus/pen
config: arc-randconfig-001-20250813 (https://download.01.org/0day-ci/archive/20250813/202508131442.PaMZ9pxz-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508131442.PaMZ9pxz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508131442.PaMZ9pxz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/hid-input.c: In function 'hidinput_configure_usage':
>> drivers/hid/hid-input.c:863:28: warning: this statement may fall through [-Wimplicit-fallthrough=]
     863 |                         if ((field->application & 0xff) == 0x02) {
         |                            ^
   drivers/hid/hid-input.c:872:17: note: here
     872 |                 case HID_GD_X: case HID_GD_Y:
         |                 ^~~~


vim +863 drivers/hid/hid-input.c

   665	
   666	static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_field *field,
   667					     struct hid_usage *usage, unsigned int usage_index)
   668	{
   669		struct input_dev *input = hidinput->input;
   670		struct hid_device *device = input_get_drvdata(input);
   671		const struct usage_priority *usage_priority = NULL;
   672		int max = 0, code;
   673		unsigned int i = 0;
   674		unsigned long *bit = NULL;
   675	
   676		field->hidinput = hidinput;
   677	
   678		if (field->flags & HID_MAIN_ITEM_CONSTANT)
   679			goto ignore;
   680	
   681		/* Ignore if report count is out of bounds. */
   682		if (field->report_count < 1)
   683			goto ignore;
   684	
   685		/* only LED usages are supported in output fields */
   686		if (field->report_type == HID_OUTPUT_REPORT &&
   687				(usage->hid & HID_USAGE_PAGE) != HID_UP_LED) {
   688			goto ignore;
   689		}
   690	
   691		/* assign a priority based on the static list declared here */
   692		for (i = 0; i < ARRAY_SIZE(hidinput_usages_priorities); i++) {
   693			if (usage->hid == hidinput_usages_priorities[i].usage) {
   694				usage_priority = &hidinput_usages_priorities[i];
   695	
   696				field->usages_priorities[usage_index] =
   697					(ARRAY_SIZE(hidinput_usages_priorities) - i) << 8;
   698				break;
   699			}
   700		}
   701	
   702		/*
   703		 * For slotted devices, we need to also add the slot index
   704		 * in the priority.
   705		 */
   706		if (usage_priority && usage_priority->global)
   707			field->usages_priorities[usage_index] |=
   708				usage_priority->slot_overwrite;
   709		else
   710			field->usages_priorities[usage_index] |=
   711				(0xff - field->slot_idx) << 16;
   712	
   713		if (device->driver->input_mapping) {
   714			int ret = device->driver->input_mapping(device, hidinput, field,
   715					usage, &bit, &max);
   716			if (ret > 0)
   717				goto mapped;
   718			if (ret < 0)
   719				goto ignore;
   720		}
   721	
   722		switch (usage->hid & HID_USAGE_PAGE) {
   723		case HID_UP_UNDEFINED:
   724			goto ignore;
   725	
   726		case HID_UP_KEYBOARD:
   727			set_bit(EV_REP, input->evbit);
   728	
   729			if ((usage->hid & HID_USAGE) < 256) {
   730				if (!hid_keyboard[usage->hid & HID_USAGE]) goto ignore;
   731				map_key_clear(hid_keyboard[usage->hid & HID_USAGE]);
   732			} else
   733				map_key(KEY_UNKNOWN);
   734	
   735			break;
   736	
   737		case HID_UP_BUTTON:
   738			code = ((usage->hid - 1) & HID_USAGE);
   739	
   740			switch (field->application) {
   741			case HID_GD_MOUSE:
   742			case HID_GD_POINTER:  code += BTN_MOUSE; break;
   743			case HID_GD_JOYSTICK:
   744					if (code <= 0xf)
   745						code += BTN_JOYSTICK;
   746					else
   747						code += BTN_TRIGGER_HAPPY - 0x10;
   748					break;
   749			case HID_GD_GAMEPAD:
   750					if (code <= 0xf)
   751						code += BTN_GAMEPAD;
   752					else
   753						code += BTN_TRIGGER_HAPPY - 0x10;
   754					break;
   755			case HID_CP_CONSUMER_CONTROL:
   756					if (hidinput_field_in_collection(device, field,
   757									 HID_COLLECTION_NAMED_ARRAY,
   758									 HID_CP_PROGRAMMABLEBUTTONS)) {
   759						if (code <= 0x1d)
   760							code += KEY_MACRO1;
   761						else
   762							code += BTN_TRIGGER_HAPPY - 0x1e;
   763						break;
   764					}
   765					fallthrough;
   766			default:
   767				switch (field->physical) {
   768				case HID_GD_MOUSE:
   769				case HID_GD_POINTER:  code += BTN_MOUSE; break;
   770				case HID_GD_JOYSTICK: code += BTN_JOYSTICK; break;
   771				case HID_GD_GAMEPAD:  code += BTN_GAMEPAD; break;
   772				default:              code += BTN_MISC;
   773				}
   774			}
   775	
   776			map_key(code);
   777			break;
   778	
   779		case HID_UP_SIMULATION:
   780			switch (usage->hid & 0xffff) {
   781			case 0xba: map_abs(ABS_RUDDER);   break;
   782			case 0xbb: map_abs(ABS_THROTTLE); break;
   783			case 0xc4: map_abs(ABS_GAS);      break;
   784			case 0xc5: map_abs(ABS_BRAKE);    break;
   785			case 0xc8: map_abs(ABS_WHEEL);    break;
   786			default:   goto ignore;
   787			}
   788			break;
   789	
   790		case HID_UP_GENDESK:
   791			if ((usage->hid & 0xf0) == 0x80) {	/* SystemControl */
   792				switch (usage->hid & 0xf) {
   793				case 0x1: map_key_clear(KEY_POWER);  break;
   794				case 0x2: map_key_clear(KEY_SLEEP);  break;
   795				case 0x3: map_key_clear(KEY_WAKEUP); break;
   796				case 0x4: map_key_clear(KEY_CONTEXT_MENU); break;
   797				case 0x5: map_key_clear(KEY_MENU); break;
   798				case 0x6: map_key_clear(KEY_PROG1); break;
   799				case 0x7: map_key_clear(KEY_HELP); break;
   800				case 0x8: map_key_clear(KEY_EXIT); break;
   801				case 0x9: map_key_clear(KEY_SELECT); break;
   802				case 0xa: map_key_clear(KEY_RIGHT); break;
   803				case 0xb: map_key_clear(KEY_LEFT); break;
   804				case 0xc: map_key_clear(KEY_UP); break;
   805				case 0xd: map_key_clear(KEY_DOWN); break;
   806				case 0xe: map_key_clear(KEY_POWER2); break;
   807				case 0xf: map_key_clear(KEY_RESTART); break;
   808				default: goto unknown;
   809				}
   810				break;
   811			}
   812	
   813			if ((usage->hid & 0xf0) == 0x90) { /* SystemControl & D-pad */
   814				switch (usage->hid) {
   815				case HID_GD_UP:	   usage->hat_dir = 1; break;
   816				case HID_GD_DOWN:  usage->hat_dir = 5; break;
   817				case HID_GD_RIGHT: usage->hat_dir = 3; break;
   818				case HID_GD_LEFT:  usage->hat_dir = 7; break;
   819				case HID_GD_DO_NOT_DISTURB:
   820					map_key_clear(KEY_DO_NOT_DISTURB); break;
   821				default: goto unknown;
   822				}
   823	
   824				if (usage->hid <= HID_GD_LEFT) {
   825					if (field->dpad) {
   826						map_abs(field->dpad);
   827						goto ignore;
   828					}
   829					map_abs(ABS_HAT0X);
   830				}
   831				break;
   832			}
   833	
   834			if ((usage->hid & 0xf0) == 0xa0) {	/* SystemControl */
   835				switch (usage->hid & 0xf) {
   836				case 0x9: map_key_clear(KEY_MICMUTE); break;
   837				case 0xa: map_key_clear(KEY_ACCESSIBILITY); break;
   838				default: goto ignore;
   839				}
   840				break;
   841			}
   842	
   843			if ((usage->hid & 0xf0) == 0xb0) {	/* SC - Display */
   844				switch (usage->hid & 0xf) {
   845				case 0x05: map_key_clear(KEY_SWITCHVIDEOMODE); break;
   846				default: goto ignore;
   847				}
   848				break;
   849			}
   850	
   851			/*
   852			 * Some lazy vendors declare 255 usages for System Control,
   853			 * leading to the creation of ABS_X|Y axis and too many others.
   854			 * It wouldn't be a problem if joydev doesn't consider the
   855			 * device as a joystick then.
   856			 */
   857			if (field->application == HID_GD_SYSTEM_CONTROL)
   858				goto ignore;
   859	
   860			switch (usage->hid) {
   861			case HID_GD_Z:
   862				/* HID_GD_Z is mapped to ABS_DISTANCE for stylus/pen */
 > 863				if ((field->application & 0xff) == 0x02) {
   864					if (field->flags & HID_MAIN_ITEM_RELATIVE)
   865						map_rel(usage->hid & 0xf);
   866					else
   867						map_abs_clear(ABS_DISTANCE);
   868					break;
   869				}
   870				/* fall through for other devices/tools */
   871			/* These usage IDs map directly to the usage codes. */
   872			case HID_GD_X: case HID_GD_Y:
   873			case HID_GD_RX: case HID_GD_RY: case HID_GD_RZ:
   874				if (field->flags & HID_MAIN_ITEM_RELATIVE)
   875					map_rel(usage->hid & 0xf);
   876				else
   877					map_abs_clear(usage->hid & 0xf);
   878				break;
   879	
   880			case HID_GD_WHEEL:
   881				if (field->flags & HID_MAIN_ITEM_RELATIVE) {
   882					set_bit(REL_WHEEL, input->relbit);
   883					map_rel(REL_WHEEL_HI_RES);
   884				} else {
   885					map_abs(usage->hid & 0xf);
   886				}
   887				break;
   888			case HID_GD_SLIDER: case HID_GD_DIAL:
   889				if (field->flags & HID_MAIN_ITEM_RELATIVE)
   890					map_rel(usage->hid & 0xf);
   891				else
   892					map_abs(usage->hid & 0xf);
   893				break;
   894	
   895			case HID_GD_HATSWITCH:
   896				usage->hat_min = field->logical_minimum;
   897				usage->hat_max = field->logical_maximum;
   898				map_abs(ABS_HAT0X);
   899				break;
   900	
   901			case HID_GD_START:	map_key_clear(BTN_START);	break;
   902			case HID_GD_SELECT:	map_key_clear(BTN_SELECT);	break;
   903	
   904			case HID_GD_RFKILL_BTN:
   905				/* MS wireless radio ctl extension, also check CA */
   906				if (field->application == HID_GD_WIRELESS_RADIO_CTLS) {
   907					map_key_clear(KEY_RFKILL);
   908					/* We need to simulate the btn release */
   909					field->flags |= HID_MAIN_ITEM_RELATIVE;
   910					break;
   911				}
   912				goto unknown;
   913	
   914			default: goto unknown;
   915			}
   916	
   917			break;
   918	
   919		case HID_UP_LED:
   920			switch (usage->hid & 0xffff) {		      /* HID-Value:                   */
   921			case 0x01:  map_led (LED_NUML);     break;    /*   "Num Lock"                 */
   922			case 0x02:  map_led (LED_CAPSL);    break;    /*   "Caps Lock"                */
   923			case 0x03:  map_led (LED_SCROLLL);  break;    /*   "Scroll Lock"              */
   924			case 0x04:  map_led (LED_COMPOSE);  break;    /*   "Compose"                  */
   925			case 0x05:  map_led (LED_KANA);     break;    /*   "Kana"                     */
   926			case 0x27:  map_led (LED_SLEEP);    break;    /*   "Stand-By"                 */
   927			case 0x4c:  map_led (LED_SUSPEND);  break;    /*   "System Suspend"           */
   928			case 0x09:  map_led (LED_MUTE);     break;    /*   "Mute"                     */
   929			case 0x4b:  map_led (LED_MISC);     break;    /*   "Generic Indicator"        */
   930			case 0x19:  map_led (LED_MAIL);     break;    /*   "Message Waiting"          */
   931			case 0x4d:  map_led (LED_CHARGING); break;    /*   "External Power Connected" */
   932	
   933			default: goto ignore;
   934			}
   935			break;
   936	
   937		case HID_UP_DIGITIZER:
   938			if ((field->application & 0xff) == 0x01) /* Digitizer */
   939				__set_bit(INPUT_PROP_POINTER, input->propbit);
   940			else if ((field->application & 0xff) == 0x02) /* Pen */
   941				__set_bit(INPUT_PROP_DIRECT, input->propbit);
   942	
   943			switch (usage->hid & 0xff) {
   944			case 0x00: /* Undefined */
   945				goto ignore;
   946	
   947			case 0x30: /* TipPressure */
   948				if (!test_bit(BTN_TOUCH, input->keybit)) {
   949					device->quirks |= HID_QUIRK_NOTOUCH;
   950					set_bit(EV_KEY, input->evbit);
   951					set_bit(BTN_TOUCH, input->keybit);
   952				}
   953				map_abs_clear(ABS_PRESSURE);
   954				break;
   955	
   956			case 0x32: /* InRange */
   957				switch (field->physical) {
   958				case HID_DG_PUCK:
   959					map_key(BTN_TOOL_MOUSE);
   960					break;
   961				case HID_DG_FINGER:
   962					map_key(BTN_TOOL_FINGER);
   963					break;
   964				default:
   965					/*
   966					 * If the physical is not given,
   967					 * rely on the application.
   968					 */
   969					if (!field->physical) {
   970						switch (field->application) {
   971						case HID_DG_TOUCHSCREEN:
   972						case HID_DG_TOUCHPAD:
   973							map_key_clear(BTN_TOOL_FINGER);
   974							break;
   975						default:
   976							map_key_clear(BTN_TOOL_PEN);
   977						}
   978					} else {
   979						map_key(BTN_TOOL_PEN);
   980					}
   981					break;
   982				}
   983				break;
   984	
   985			case 0x3b: /* Battery Strength */
   986				hidinput_setup_battery(device, HID_INPUT_REPORT, field, false);
   987				usage->type = EV_PWR;
   988				return;
   989	
   990			case 0x3c: /* Invert */
   991				device->quirks &= ~HID_QUIRK_NOINVERT;
   992				map_key_clear(BTN_TOOL_RUBBER);
   993				break;
   994	
   995			case 0x3d: /* X Tilt */
   996				map_abs_clear(ABS_TILT_X);
   997				break;
   998	
   999			case 0x3e: /* Y Tilt */
  1000				map_abs_clear(ABS_TILT_Y);
  1001				break;
  1002	
  1003			case 0x33: /* Touch */
  1004			case 0x42: /* TipSwitch */
  1005			case 0x43: /* TipSwitch2 */
  1006				device->quirks &= ~HID_QUIRK_NOTOUCH;
  1007				map_key_clear(BTN_TOUCH);
  1008				break;
  1009	
  1010			case 0x44: /* BarrelSwitch */
  1011				map_key_clear(BTN_STYLUS);
  1012				break;
  1013	
  1014			case 0x45: /* ERASER */
  1015				/*
  1016				 * This event is reported when eraser tip touches the surface.
  1017				 * Actual eraser (BTN_TOOL_RUBBER) is set and released either
  1018				 * by Invert if tool reports proximity or by Eraser directly.
  1019				 */
  1020				if (!test_bit(BTN_TOOL_RUBBER, input->keybit)) {
  1021					device->quirks |= HID_QUIRK_NOINVERT;
  1022					set_bit(BTN_TOOL_RUBBER, input->keybit);
  1023				}
  1024				map_key_clear(BTN_TOUCH);
  1025				break;
  1026	
  1027			case 0x46: /* TabletPick */
  1028			case 0x5a: /* SecondaryBarrelSwitch */
  1029				map_key_clear(BTN_STYLUS2);
  1030				break;
  1031	
  1032			case 0x5b: /* TransducerSerialNumber */
  1033			case 0x6e: /* TransducerSerialNumber2 */
  1034				map_msc(MSC_SERIAL);
  1035				break;
  1036	
  1037			default:  goto unknown;
  1038			}
  1039			break;
  1040	
  1041		case HID_UP_TELEPHONY:
  1042			switch (usage->hid & HID_USAGE) {
  1043			case 0x2f: map_key_clear(KEY_MICMUTE);		break;
  1044			case 0xb0: map_key_clear(KEY_NUMERIC_0);	break;
  1045			case 0xb1: map_key_clear(KEY_NUMERIC_1);	break;
  1046			case 0xb2: map_key_clear(KEY_NUMERIC_2);	break;
  1047			case 0xb3: map_key_clear(KEY_NUMERIC_3);	break;
  1048			case 0xb4: map_key_clear(KEY_NUMERIC_4);	break;
  1049			case 0xb5: map_key_clear(KEY_NUMERIC_5);	break;
  1050			case 0xb6: map_key_clear(KEY_NUMERIC_6);	break;
  1051			case 0xb7: map_key_clear(KEY_NUMERIC_7);	break;
  1052			case 0xb8: map_key_clear(KEY_NUMERIC_8);	break;
  1053			case 0xb9: map_key_clear(KEY_NUMERIC_9);	break;
  1054			case 0xba: map_key_clear(KEY_NUMERIC_STAR);	break;
  1055			case 0xbb: map_key_clear(KEY_NUMERIC_POUND);	break;
  1056			case 0xbc: map_key_clear(KEY_NUMERIC_A);	break;
  1057			case 0xbd: map_key_clear(KEY_NUMERIC_B);	break;
  1058			case 0xbe: map_key_clear(KEY_NUMERIC_C);	break;
  1059			case 0xbf: map_key_clear(KEY_NUMERIC_D);	break;
  1060			default: goto ignore;
  1061			}
  1062			break;
  1063	
  1064		case HID_UP_CONSUMER:	/* USB HUT v1.12, pages 75-84 */
  1065			switch (usage->hid & HID_USAGE) {
  1066			case 0x000: goto ignore;
  1067			case 0x030: map_key_clear(KEY_POWER);		break;
  1068			case 0x031: map_key_clear(KEY_RESTART);		break;
  1069			case 0x032: map_key_clear(KEY_SLEEP);		break;
  1070			case 0x034: map_key_clear(KEY_SLEEP);		break;
  1071			case 0x035: map_key_clear(KEY_KBDILLUMTOGGLE);	break;
  1072			case 0x036: map_key_clear(BTN_MISC);		break;
  1073	
  1074			case 0x040: map_key_clear(KEY_MENU);		break; /* Menu */
  1075			case 0x041: map_key_clear(KEY_SELECT);		break; /* Menu Pick */
  1076			case 0x042: map_key_clear(KEY_UP);		break; /* Menu Up */
  1077			case 0x043: map_key_clear(KEY_DOWN);		break; /* Menu Down */
  1078			case 0x044: map_key_clear(KEY_LEFT);		break; /* Menu Left */
  1079			case 0x045: map_key_clear(KEY_RIGHT);		break; /* Menu Right */
  1080			case 0x046: map_key_clear(KEY_ESC);		break; /* Menu Escape */
  1081			case 0x047: map_key_clear(KEY_KPPLUS);		break; /* Menu Value Increase */
  1082			case 0x048: map_key_clear(KEY_KPMINUS);		break; /* Menu Value Decrease */
  1083	
  1084			case 0x060: map_key_clear(KEY_INFO);		break; /* Data On Screen */
  1085			case 0x061: map_key_clear(KEY_SUBTITLE);	break; /* Closed Caption */
  1086			case 0x063: map_key_clear(KEY_VCR);		break; /* VCR/TV */
  1087			case 0x065: map_key_clear(KEY_CAMERA);		break; /* Snapshot */
  1088			case 0x069: map_key_clear(KEY_RED);		break;
  1089			case 0x06a: map_key_clear(KEY_GREEN);		break;
  1090			case 0x06b: map_key_clear(KEY_BLUE);		break;
  1091			case 0x06c: map_key_clear(KEY_YELLOW);		break;
  1092			case 0x06d: map_key_clear(KEY_ASPECT_RATIO);	break;
  1093	
  1094			case 0x06f: map_key_clear(KEY_BRIGHTNESSUP);		break;
  1095			case 0x070: map_key_clear(KEY_BRIGHTNESSDOWN);		break;
  1096			case 0x072: map_key_clear(KEY_BRIGHTNESS_TOGGLE);	break;
  1097			case 0x073: map_key_clear(KEY_BRIGHTNESS_MIN);		break;
  1098			case 0x074: map_key_clear(KEY_BRIGHTNESS_MAX);		break;
  1099			case 0x075: map_key_clear(KEY_BRIGHTNESS_AUTO);		break;
  1100	
  1101			case 0x076: map_key_clear(KEY_CAMERA_ACCESS_ENABLE);	break;
  1102			case 0x077: map_key_clear(KEY_CAMERA_ACCESS_DISABLE);	break;
  1103			case 0x078: map_key_clear(KEY_CAMERA_ACCESS_TOGGLE);	break;
  1104	
  1105			case 0x079: map_key_clear(KEY_KBDILLUMUP);	break;
  1106			case 0x07a: map_key_clear(KEY_KBDILLUMDOWN);	break;
  1107			case 0x07c: map_key_clear(KEY_KBDILLUMTOGGLE);	break;
  1108	
  1109			case 0x082: map_key_clear(KEY_VIDEO_NEXT);	break;
  1110			case 0x083: map_key_clear(KEY_LAST);		break;
  1111			case 0x084: map_key_clear(KEY_ENTER);		break;
  1112			case 0x088: map_key_clear(KEY_PC);		break;
  1113			case 0x089: map_key_clear(KEY_TV);		break;
  1114			case 0x08a: map_key_clear(KEY_WWW);		break;
  1115			case 0x08b: map_key_clear(KEY_DVD);		break;
  1116			case 0x08c: map_key_clear(KEY_PHONE);		break;
  1117			case 0x08d: map_key_clear(KEY_PROGRAM);		break;
  1118			case 0x08e: map_key_clear(KEY_VIDEOPHONE);	break;
  1119			case 0x08f: map_key_clear(KEY_GAMES);		break;
  1120			case 0x090: map_key_clear(KEY_MEMO);		break;
  1121			case 0x091: map_key_clear(KEY_CD);		break;
  1122			case 0x092: map_key_clear(KEY_VCR);		break;
  1123			case 0x093: map_key_clear(KEY_TUNER);		break;
  1124			case 0x094: map_key_clear(KEY_EXIT);		break;
  1125			case 0x095: map_key_clear(KEY_HELP);		break;
  1126			case 0x096: map_key_clear(KEY_TAPE);		break;
  1127			case 0x097: map_key_clear(KEY_TV2);		break;
  1128			case 0x098: map_key_clear(KEY_SAT);		break;
  1129			case 0x09a: map_key_clear(KEY_PVR);		break;
  1130	
  1131			case 0x09c: map_key_clear(KEY_CHANNELUP);	break;
  1132			case 0x09d: map_key_clear(KEY_CHANNELDOWN);	break;
  1133			case 0x0a0: map_key_clear(KEY_VCR2);		break;
  1134	
  1135			case 0x0b0: map_key_clear(KEY_PLAY);		break;
  1136			case 0x0b1: map_key_clear(KEY_PAUSE);		break;
  1137			case 0x0b2: map_key_clear(KEY_RECORD);		break;
  1138			case 0x0b3: map_key_clear(KEY_FASTFORWARD);	break;
  1139			case 0x0b4: map_key_clear(KEY_REWIND);		break;
  1140			case 0x0b5: map_key_clear(KEY_NEXTSONG);	break;
  1141			case 0x0b6: map_key_clear(KEY_PREVIOUSSONG);	break;
  1142			case 0x0b7: map_key_clear(KEY_STOPCD);		break;
  1143			case 0x0b8: map_key_clear(KEY_EJECTCD);		break;
  1144			case 0x0bc: map_key_clear(KEY_MEDIA_REPEAT);	break;
  1145			case 0x0b9: map_key_clear(KEY_SHUFFLE);		break;
  1146			case 0x0bf: map_key_clear(KEY_SLOW);		break;
  1147	
  1148			case 0x0cd: map_key_clear(KEY_PLAYPAUSE);	break;
  1149			case 0x0cf: map_key_clear(KEY_VOICECOMMAND);	break;
  1150	
  1151			case 0x0d8: map_key_clear(KEY_DICTATE);		break;
  1152			case 0x0d9: map_key_clear(KEY_EMOJI_PICKER);	break;
  1153	
  1154			case 0x0e0: map_abs_clear(ABS_VOLUME);		break;
  1155			case 0x0e2: map_key_clear(KEY_MUTE);		break;
  1156			case 0x0e5: map_key_clear(KEY_BASSBOOST);	break;
  1157			case 0x0e9: map_key_clear(KEY_VOLUMEUP);	break;
  1158			case 0x0ea: map_key_clear(KEY_VOLUMEDOWN);	break;
  1159			case 0x0f5: map_key_clear(KEY_SLOW);		break;
  1160	
  1161			case 0x181: map_key_clear(KEY_BUTTONCONFIG);	break;
  1162			case 0x182: map_key_clear(KEY_BOOKMARKS);	break;
  1163			case 0x183: map_key_clear(KEY_CONFIG);		break;
  1164			case 0x184: map_key_clear(KEY_WORDPROCESSOR);	break;
  1165			case 0x185: map_key_clear(KEY_EDITOR);		break;
  1166			case 0x186: map_key_clear(KEY_SPREADSHEET);	break;
  1167			case 0x187: map_key_clear(KEY_GRAPHICSEDITOR);	break;
  1168			case 0x188: map_key_clear(KEY_PRESENTATION);	break;
  1169			case 0x189: map_key_clear(KEY_DATABASE);	break;
  1170			case 0x18a: map_key_clear(KEY_MAIL);		break;
  1171			case 0x18b: map_key_clear(KEY_NEWS);		break;
  1172			case 0x18c: map_key_clear(KEY_VOICEMAIL);	break;
  1173			case 0x18d: map_key_clear(KEY_ADDRESSBOOK);	break;
  1174			case 0x18e: map_key_clear(KEY_CALENDAR);	break;
  1175			case 0x18f: map_key_clear(KEY_TASKMANAGER);	break;
  1176			case 0x190: map_key_clear(KEY_JOURNAL);		break;
  1177			case 0x191: map_key_clear(KEY_FINANCE);		break;
  1178			case 0x192: map_key_clear(KEY_CALC);		break;
  1179			case 0x193: map_key_clear(KEY_PLAYER);		break;
  1180			case 0x194: map_key_clear(KEY_FILE);		break;
  1181			case 0x196: map_key_clear(KEY_WWW);		break;
  1182			case 0x199: map_key_clear(KEY_CHAT);		break;
  1183			case 0x19c: map_key_clear(KEY_LOGOFF);		break;
  1184			case 0x19e: map_key_clear(KEY_COFFEE);		break;
  1185			case 0x19f: map_key_clear(KEY_CONTROLPANEL);		break;
  1186			case 0x1a2: map_key_clear(KEY_APPSELECT);		break;
  1187			case 0x1a3: map_key_clear(KEY_NEXT);		break;
  1188			case 0x1a4: map_key_clear(KEY_PREVIOUS);	break;
  1189			case 0x1a6: map_key_clear(KEY_HELP);		break;
  1190			case 0x1a7: map_key_clear(KEY_DOCUMENTS);	break;
  1191			case 0x1ab: map_key_clear(KEY_SPELLCHECK);	break;
  1192			case 0x1ae: map_key_clear(KEY_KEYBOARD);	break;
  1193			case 0x1b1: map_key_clear(KEY_SCREENSAVER);		break;
  1194			case 0x1b4: map_key_clear(KEY_FILE);		break;
  1195			case 0x1b6: map_key_clear(KEY_IMAGES);		break;
  1196			case 0x1b7: map_key_clear(KEY_AUDIO);		break;
  1197			case 0x1b8: map_key_clear(KEY_VIDEO);		break;
  1198			case 0x1bc: map_key_clear(KEY_MESSENGER);	break;
  1199			case 0x1bd: map_key_clear(KEY_INFO);		break;
  1200			case 0x1cb: map_key_clear(KEY_ASSISTANT);	break;
  1201			case 0x201: map_key_clear(KEY_NEW);		break;
  1202			case 0x202: map_key_clear(KEY_OPEN);		break;
  1203			case 0x203: map_key_clear(KEY_CLOSE);		break;
  1204			case 0x204: map_key_clear(KEY_EXIT);		break;
  1205			case 0x207: map_key_clear(KEY_SAVE);		break;
  1206			case 0x208: map_key_clear(KEY_PRINT);		break;
  1207			case 0x209: map_key_clear(KEY_PROPS);		break;
  1208			case 0x21a: map_key_clear(KEY_UNDO);		break;
  1209			case 0x21b: map_key_clear(KEY_COPY);		break;
  1210			case 0x21c: map_key_clear(KEY_CUT);		break;
  1211			case 0x21d: map_key_clear(KEY_PASTE);		break;
  1212			case 0x21f: map_key_clear(KEY_FIND);		break;
  1213			case 0x221: map_key_clear(KEY_SEARCH);		break;
  1214			case 0x222: map_key_clear(KEY_GOTO);		break;
  1215			case 0x223: map_key_clear(KEY_HOMEPAGE);	break;
  1216			case 0x224: map_key_clear(KEY_BACK);		break;
  1217			case 0x225: map_key_clear(KEY_FORWARD);		break;
  1218			case 0x226: map_key_clear(KEY_STOP);		break;
  1219			case 0x227: map_key_clear(KEY_REFRESH);		break;
  1220			case 0x22a: map_key_clear(KEY_BOOKMARKS);	break;
  1221			case 0x22d: map_key_clear(KEY_ZOOMIN);		break;
  1222			case 0x22e: map_key_clear(KEY_ZOOMOUT);		break;
  1223			case 0x22f: map_key_clear(KEY_ZOOMRESET);	break;
  1224			case 0x232: map_key_clear(KEY_FULL_SCREEN);	break;
  1225			case 0x233: map_key_clear(KEY_SCROLLUP);	break;
  1226			case 0x234: map_key_clear(KEY_SCROLLDOWN);	break;
  1227			case 0x238: /* AC Pan */
  1228				set_bit(REL_HWHEEL, input->relbit);
  1229				map_rel(REL_HWHEEL_HI_RES);
  1230				break;
  1231			case 0x23d: map_key_clear(KEY_EDIT);		break;
  1232			case 0x25f: map_key_clear(KEY_CANCEL);		break;
  1233			case 0x269: map_key_clear(KEY_INSERT);		break;
  1234			case 0x26a: map_key_clear(KEY_DELETE);		break;
  1235			case 0x279: map_key_clear(KEY_REDO);		break;
  1236	
  1237			case 0x289: map_key_clear(KEY_REPLY);		break;
  1238			case 0x28b: map_key_clear(KEY_FORWARDMAIL);	break;
  1239			case 0x28c: map_key_clear(KEY_SEND);		break;
  1240	
  1241			case 0x29d: map_key_clear(KEY_KBD_LAYOUT_NEXT);	break;
  1242	
  1243			case 0x2a2: map_key_clear(KEY_ALL_APPLICATIONS);	break;
  1244	
  1245			case 0x2c7: map_key_clear(KEY_KBDINPUTASSIST_PREV);		break;
  1246			case 0x2c8: map_key_clear(KEY_KBDINPUTASSIST_NEXT);		break;
  1247			case 0x2c9: map_key_clear(KEY_KBDINPUTASSIST_PREVGROUP);		break;
  1248			case 0x2ca: map_key_clear(KEY_KBDINPUTASSIST_NEXTGROUP);		break;
  1249			case 0x2cb: map_key_clear(KEY_KBDINPUTASSIST_ACCEPT);	break;
  1250			case 0x2cc: map_key_clear(KEY_KBDINPUTASSIST_CANCEL);	break;
  1251	
  1252			case 0x29f: map_key_clear(KEY_SCALE);		break;
  1253	
  1254			default: map_key_clear(KEY_UNKNOWN);
  1255			}
  1256			break;
  1257	
  1258		case HID_UP_GENDEVCTRLS:
  1259			switch (usage->hid) {
  1260			case HID_DC_BATTERYSTRENGTH:
  1261				hidinput_setup_battery(device, HID_INPUT_REPORT, field, false);
  1262				usage->type = EV_PWR;
  1263				return;
  1264			}
  1265			goto unknown;
  1266	
  1267		case HID_UP_BATTERY:
  1268			switch (usage->hid) {
  1269			case HID_BAT_ABSOLUTESTATEOFCHARGE:
  1270				hidinput_setup_battery(device, HID_INPUT_REPORT, field, true);
  1271				usage->type = EV_PWR;
  1272				return;
  1273			case HID_BAT_CHARGING:
  1274				usage->type = EV_PWR;
  1275				return;
  1276			}
  1277			goto unknown;
  1278		case HID_UP_CAMERA:
  1279			switch (usage->hid & HID_USAGE) {
  1280			case 0x020:
  1281				map_key_clear(KEY_CAMERA_FOCUS);	break;
  1282			case 0x021:
  1283				map_key_clear(KEY_CAMERA);		break;
  1284			default:
  1285				goto ignore;
  1286			}
  1287			break;
  1288	
  1289		case HID_UP_HPVENDOR:	/* Reported on a Dutch layout HP5308 */
  1290			set_bit(EV_REP, input->evbit);
  1291			switch (usage->hid & HID_USAGE) {
  1292			case 0x021: map_key_clear(KEY_PRINT);           break;
  1293			case 0x070: map_key_clear(KEY_HP);		break;
  1294			case 0x071: map_key_clear(KEY_CAMERA);		break;
  1295			case 0x072: map_key_clear(KEY_SOUND);		break;
  1296			case 0x073: map_key_clear(KEY_QUESTION);	break;
  1297			case 0x080: map_key_clear(KEY_EMAIL);		break;
  1298			case 0x081: map_key_clear(KEY_CHAT);		break;
  1299			case 0x082: map_key_clear(KEY_SEARCH);		break;
  1300			case 0x083: map_key_clear(KEY_CONNECT);	        break;
  1301			case 0x084: map_key_clear(KEY_FINANCE);		break;
  1302			case 0x085: map_key_clear(KEY_SPORT);		break;
  1303			case 0x086: map_key_clear(KEY_SHOP);	        break;
  1304			default:    goto ignore;
  1305			}
  1306			break;
  1307	
  1308		case HID_UP_HPVENDOR2:
  1309			set_bit(EV_REP, input->evbit);
  1310			switch (usage->hid & HID_USAGE) {
  1311			case 0x001: map_key_clear(KEY_MICMUTE);		break;
  1312			case 0x003: map_key_clear(KEY_BRIGHTNESSDOWN);	break;
  1313			case 0x004: map_key_clear(KEY_BRIGHTNESSUP);	break;
  1314			default:    goto ignore;
  1315			}
  1316			break;
  1317	
  1318		case HID_UP_MSVENDOR:
  1319			goto ignore;
  1320	
  1321		case HID_UP_CUSTOM: /* Reported on Logitech and Apple USB keyboards */
  1322			set_bit(EV_REP, input->evbit);
  1323			goto ignore;
  1324	
  1325		case HID_UP_LOGIVENDOR:
  1326			/* intentional fallback */
  1327		case HID_UP_LOGIVENDOR2:
  1328			/* intentional fallback */
  1329		case HID_UP_LOGIVENDOR3:
  1330			goto ignore;
  1331	
  1332		case HID_UP_PID:
  1333			switch (usage->hid & HID_USAGE) {
  1334			case 0xa4: map_key_clear(BTN_DEAD);	break;
  1335			default: goto ignore;
  1336			}
  1337			break;
  1338	
  1339		default:
  1340		unknown:
  1341			if (field->report_size == 1) {
  1342				if (field->report->type == HID_OUTPUT_REPORT) {
  1343					map_led(LED_MISC);
  1344					break;
  1345				}
  1346				map_key(BTN_MISC);
  1347				break;
  1348			}
  1349			if (field->flags & HID_MAIN_ITEM_RELATIVE) {
  1350				map_rel(REL_MISC);
  1351				break;
  1352			}
  1353			map_abs(ABS_MISC);
  1354			break;
  1355		}
  1356	
  1357	mapped:
  1358		/* Mapping failed, bail out */
  1359		if (!bit)
  1360			return;
  1361	
  1362		if (device->driver->input_mapped &&
  1363		    device->driver->input_mapped(device, hidinput, field, usage,
  1364						 &bit, &max) < 0) {
  1365			/*
  1366			 * The driver indicated that no further generic handling
  1367			 * of the usage is desired.
  1368			 */
  1369			return;
  1370		}
  1371	
  1372		set_bit(usage->type, input->evbit);
  1373	
  1374		/*
  1375		 * This part is *really* controversial:
  1376		 * - HID aims at being generic so we should do our best to export
  1377		 *   all incoming events
  1378		 * - HID describes what events are, so there is no reason for ABS_X
  1379		 *   to be mapped to ABS_Y
  1380		 * - HID is using *_MISC+N as a default value, but nothing prevents
  1381		 *   *_MISC+N to overwrite a legitimate even, which confuses userspace
  1382		 *   (for instance ABS_MISC + 7 is ABS_MT_SLOT, which has a different
  1383		 *   processing)
  1384		 *
  1385		 * If devices still want to use this (at their own risk), they will
  1386		 * have to use the quirk HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE, but
  1387		 * the default should be a reliable mapping.
  1388		 */
  1389		while (usage->code <= max && test_and_set_bit(usage->code, bit)) {
  1390			if (device->quirks & HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE) {
  1391				usage->code = find_next_zero_bit(bit,
  1392								 max + 1,
  1393								 usage->code);
  1394			} else {
  1395				device->status |= HID_STAT_DUP_DETECTED;
  1396				goto ignore;
  1397			}
  1398		}
  1399	
  1400		if (usage->code > max)
  1401			goto ignore;
  1402	
  1403		if (usage->type == EV_ABS) {
  1404	
  1405			int a = field->logical_minimum;
  1406			int b = field->logical_maximum;
  1407	
  1408			if ((device->quirks & HID_QUIRK_BADPAD) && (usage->code == ABS_X || usage->code == ABS_Y)) {
  1409				a = field->logical_minimum = 0;
  1410				b = field->logical_maximum = 255;
  1411			}
  1412	
  1413			if (field->application == HID_GD_GAMEPAD || field->application == HID_GD_JOYSTICK)
  1414				input_set_abs_params(input, usage->code, a, b, (b - a) >> 8, (b - a) >> 4);
  1415			else	input_set_abs_params(input, usage->code, a, b, 0, 0);
  1416	
  1417			input_abs_set_res(input, usage->code,
  1418					  hidinput_calc_abs_res(field, usage->code));
  1419	
  1420			/* use a larger default input buffer for MT devices */
  1421			if (usage->code == ABS_MT_POSITION_X && input->hint_events_per_packet == 0)
  1422				input_set_events_per_packet(input, 60);
  1423		}
  1424	
  1425		if (usage->type == EV_ABS &&
  1426		    (usage->hat_min < usage->hat_max || usage->hat_dir)) {
  1427			int i;
  1428			for (i = usage->code; i < usage->code + 2 && i <= max; i++) {
  1429				input_set_abs_params(input, i, -1, 1, 0, 0);
  1430				set_bit(i, input->absbit);
  1431			}
  1432			if (usage->hat_dir && !field->dpad)
  1433				field->dpad = usage->code;
  1434		}
  1435	
  1436		/* for those devices which produce Consumer volume usage as relative,
  1437		 * we emulate pressing volumeup/volumedown appropriate number of times
  1438		 * in hidinput_hid_event()
  1439		 */
  1440		if ((usage->type == EV_ABS) && (field->flags & HID_MAIN_ITEM_RELATIVE) &&
  1441				(usage->code == ABS_VOLUME)) {
  1442			set_bit(KEY_VOLUMEUP, input->keybit);
  1443			set_bit(KEY_VOLUMEDOWN, input->keybit);
  1444		}
  1445	
  1446		if (usage->type == EV_KEY) {
  1447			set_bit(EV_MSC, input->evbit);
  1448			set_bit(MSC_SCAN, input->mscbit);
  1449		}
  1450	
  1451		return;
  1452	
  1453	ignore:
  1454		usage->type = 0;
  1455		usage->code = 0;
  1456	}
  1457	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

