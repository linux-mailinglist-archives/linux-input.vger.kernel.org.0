Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 263651E9C43
	for <lists+linux-input@lfdr.de>; Mon,  1 Jun 2020 05:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgFAD66 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 31 May 2020 23:58:58 -0400
Received: from mga07.intel.com ([134.134.136.100]:23011 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727089AbgFAD66 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 31 May 2020 23:58:58 -0400
IronPort-SDR: PdDTwbC1fSFLjw4WCoTS7vXXSzicL+HHWlxD7YhIrHB6MdQ9Z9eLDq5yqoSyjV0GqF1e1qUhJs
 /vx5/AZmnxQA==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2020 20:56:48 -0700
IronPort-SDR: sOOfkEZ105Z0QHwgpBRKFpiYRBxIsbIITGKmqCS9510TC6bW3+zI23S2Cb0o9giPIuorQkyWDE
 EgbxxJK+7Vqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,459,1583222400"; 
   d="gz'50?scan'50,208,50";a="257856585"
Received: from lkp-server01.sh.intel.com (HELO 49d03d9b0ee7) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 May 2020 20:56:44 -0700
Received: from kbuild by 49d03d9b0ee7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jfbZ6-00009w-34; Mon, 01 Jun 2020 03:56:44 +0000
Date:   Mon, 1 Jun 2020 11:55:54 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>, dmitry.torokhov@gmail.com,
        johan@kernel.org, vdronov@redhat.com, tglx@linutronix.de,
        gregkh@linuxfoundation.org
Cc:     kbuild-all@lists.01.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: Re: [PATCH] input: tablet: aiptek: fix possible buffer overflow
 caused by bad DMA value in aiptek_irq()
Message-ID: <202006011106.RQGxcInB%lkp@intel.com>
References: <20200530073935.17874-1-baijiaju1990@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline
In-Reply-To: <20200530073935.17874-1-baijiaju1990@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jia-Ju,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on input/next]
[also build test WARNING on v5.7 next-20200529]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Jia-Ju-Bai/input-tablet-aiptek-fix-possible-buffer-overflow-caused-by-bad-DMA-value-in-aiptek_irq/20200601-015649
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
config: mips-randconfig-r032-20200531 (attached as .config)
compiler: mipsel-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=mips 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

In file included from include/asm-generic/div64.h:25,
from arch/mips/include/asm/div64.h:12,
from include/linux/math64.h:6,
from include/linux/jiffies.h:6,
from drivers/input/tablet/aiptek.c:60:
drivers/input/tablet/aiptek.c: In function 'aiptek_irq':
drivers/input/tablet/aiptek.c:744:7: error: 'marco' undeclared (first use in this function); did you mean 'macro'?
744 |   if (marco > 0 && macro < 25) {
|       ^~~~~
include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
|                                                    ^~~~
>> drivers/input/tablet/aiptek.c:744:3: note: in expansion of macro 'if'
744 |   if (marco > 0 && macro < 25) {
|   ^~
drivers/input/tablet/aiptek.c:744:7: note: each undeclared identifier is reported only once for each function it appears in
744 |   if (marco > 0 && macro < 25) {
|       ^~~~~
include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
|                                                    ^~~~
>> drivers/input/tablet/aiptek.c:744:3: note: in expansion of macro 'if'
744 |   if (marco > 0 && macro < 25) {
|   ^~

vim +/if +744 drivers/input/tablet/aiptek.c

   377	
   378	/***********************************************************************
   379	 * aiptek_irq can receive one of six potential reports.
   380	 * The documentation for each is in the body of the function.
   381	 *
   382	 * The tablet reports on several attributes per invocation of
   383	 * aiptek_irq. Because the Linux Input Event system allows the
   384	 * transmission of ONE attribute per input_report_xxx() call,
   385	 * collation has to be done on the other end to reconstitute
   386	 * a complete tablet report. Further, the number of Input Event reports
   387	 * submitted varies, depending on what USB report type, and circumstance.
   388	 * To deal with this, EV_MSC is used to indicate an 'end-of-report'
   389	 * message. This has been an undocumented convention understood by the kernel
   390	 * tablet driver and clients such as gpm and XFree86's tablet drivers.
   391	 *
   392	 * Of the information received from the tablet, the one piece I
   393	 * cannot transmit is the proximity bit (without resorting to an EV_MSC
   394	 * convention above.) I therefore have taken over REL_MISC and ABS_MISC
   395	 * (for relative and absolute reports, respectively) for communicating
   396	 * Proximity. Why two events? I thought it interesting to know if the
   397	 * Proximity event occurred while the tablet was in absolute or relative
   398	 * mode.
   399	 * Update: REL_MISC proved not to be such a good idea. With REL_MISC you
   400	 * get an event transmitted each time. ABS_MISC works better, since it
   401	 * can be set and re-set. Thus, only using ABS_MISC from now on.
   402	 *
   403	 * Other tablets use the notion of a certain minimum stylus pressure
   404	 * to infer proximity. While that could have been done, that is yet
   405	 * another 'by convention' behavior, the documentation for which
   406	 * would be spread between two (or more) pieces of software.
   407	 *
   408	 * EV_MSC usage was terminated for this purpose in Linux 2.5.x, and
   409	 * replaced with the input_sync() method (which emits EV_SYN.)
   410	 */
   411	
   412	static void aiptek_irq(struct urb *urb)
   413	{
   414		struct aiptek *aiptek = urb->context;
   415		unsigned char *data = aiptek->data;
   416		struct input_dev *inputdev = aiptek->inputdev;
   417		struct usb_interface *intf = aiptek->intf;
   418		int jitterable = 0;
   419		int retval, macro, x, y, z, left, right, middle, p, dv, tip, bs, pck;
   420	
   421		switch (urb->status) {
   422		case 0:
   423			/* Success */
   424			break;
   425	
   426		case -ECONNRESET:
   427		case -ENOENT:
   428		case -ESHUTDOWN:
   429			/* This urb is terminated, clean up */
   430			dev_dbg(&intf->dev, "%s - urb shutting down with status: %d\n",
   431				__func__, urb->status);
   432			return;
   433	
   434		default:
   435			dev_dbg(&intf->dev, "%s - nonzero urb status received: %d\n",
   436				__func__, urb->status);
   437			goto exit;
   438		}
   439	
   440		/* See if we are in a delay loop -- throw out report if true.
   441		 */
   442		if (aiptek->inDelay == 1 && time_after(aiptek->endDelay, jiffies)) {
   443			goto exit;
   444		}
   445	
   446		aiptek->inDelay = 0;
   447		aiptek->eventCount++;
   448	
   449		/* Report 1 delivers relative coordinates with either a stylus
   450		 * or the mouse. You do not know, however, which input
   451		 * tool generated the event.
   452		 */
   453		if (data[0] == 1) {
   454			if (aiptek->curSetting.coordinateMode ==
   455			    AIPTEK_COORDINATE_ABSOLUTE_MODE) {
   456				aiptek->diagnostic =
   457				    AIPTEK_DIAGNOSTIC_SENDING_RELATIVE_IN_ABSOLUTE;
   458			} else {
   459				x = (signed char) data[2];
   460				y = (signed char) data[3];
   461	
   462				/* jitterable keeps track of whether any button has been pressed.
   463				 * We're also using it to remap the physical mouse button mask
   464				 * to pseudo-settings. (We don't specifically care about it's
   465				 * value after moving/transposing mouse button bitmasks, except
   466				 * that a non-zero value indicates that one or more
   467				 * mouse button was pressed.)
   468				 */
   469				jitterable = data[1] & 0x07;
   470	
   471				left = (data[1] & aiptek->curSetting.mouseButtonLeft >> 2) != 0 ? 1 : 0;
   472				right = (data[1] & aiptek->curSetting.mouseButtonRight >> 2) != 0 ? 1 : 0;
   473				middle = (data[1] & aiptek->curSetting.mouseButtonMiddle >> 2) != 0 ? 1 : 0;
   474	
   475				input_report_key(inputdev, BTN_LEFT, left);
   476				input_report_key(inputdev, BTN_MIDDLE, middle);
   477				input_report_key(inputdev, BTN_RIGHT, right);
   478	
   479				input_report_abs(inputdev, ABS_MISC,
   480						 1 | AIPTEK_REPORT_TOOL_UNKNOWN);
   481				input_report_rel(inputdev, REL_X, x);
   482				input_report_rel(inputdev, REL_Y, y);
   483	
   484				/* Wheel support is in the form of a single-event
   485				 * firing.
   486				 */
   487				if (aiptek->curSetting.wheel != AIPTEK_WHEEL_DISABLE) {
   488					input_report_rel(inputdev, REL_WHEEL,
   489							 aiptek->curSetting.wheel);
   490					aiptek->curSetting.wheel = AIPTEK_WHEEL_DISABLE;
   491				}
   492				if (aiptek->lastMacro != -1) {
   493				        input_report_key(inputdev,
   494							 macroKeyEvents[aiptek->lastMacro], 0);
   495					aiptek->lastMacro = -1;
   496				}
   497				input_sync(inputdev);
   498			}
   499		}
   500		/* Report 2 is delivered only by the stylus, and delivers
   501		 * absolute coordinates.
   502		 */
   503		else if (data[0] == 2) {
   504			if (aiptek->curSetting.coordinateMode == AIPTEK_COORDINATE_RELATIVE_MODE) {
   505				aiptek->diagnostic = AIPTEK_DIAGNOSTIC_SENDING_ABSOLUTE_IN_RELATIVE;
   506			} else if (!AIPTEK_POINTER_ALLOW_STYLUS_MODE
   507				    (aiptek->curSetting.pointerMode)) {
   508					aiptek->diagnostic = AIPTEK_DIAGNOSTIC_TOOL_DISALLOWED;
   509			} else {
   510				x = get_unaligned_le16(data + 1);
   511				y = get_unaligned_le16(data + 3);
   512				z = get_unaligned_le16(data + 6);
   513	
   514				dv = (data[5] & 0x01) != 0 ? 1 : 0;
   515				p = (data[5] & 0x02) != 0 ? 1 : 0;
   516				tip = (data[5] & 0x04) != 0 ? 1 : 0;
   517	
   518				/* Use jitterable to re-arrange button masks
   519				 */
   520				jitterable = data[5] & 0x18;
   521	
   522				bs = (data[5] & aiptek->curSetting.stylusButtonLower) != 0 ? 1 : 0;
   523				pck = (data[5] & aiptek->curSetting.stylusButtonUpper) != 0 ? 1 : 0;
   524	
   525				/* dv indicates 'data valid' (e.g., the tablet is in sync
   526				 * and has delivered a "correct" report) We will ignore
   527				 * all 'bad' reports...
   528				 */
   529				if (dv != 0) {
   530					/* If the selected tool changed, reset the old
   531					 * tool key, and set the new one.
   532					 */
   533					if (aiptek->previousToolMode !=
   534					    aiptek->curSetting.toolMode) {
   535					        input_report_key(inputdev,
   536								 aiptek->previousToolMode, 0);
   537						input_report_key(inputdev,
   538								 aiptek->curSetting.toolMode,
   539								 1);
   540						aiptek->previousToolMode =
   541						          aiptek->curSetting.toolMode;
   542					}
   543	
   544					if (p != 0) {
   545						input_report_abs(inputdev, ABS_X, x);
   546						input_report_abs(inputdev, ABS_Y, y);
   547						input_report_abs(inputdev, ABS_PRESSURE, z);
   548	
   549						input_report_key(inputdev, BTN_TOUCH, tip);
   550						input_report_key(inputdev, BTN_STYLUS, bs);
   551						input_report_key(inputdev, BTN_STYLUS2, pck);
   552	
   553						if (aiptek->curSetting.xTilt !=
   554						    AIPTEK_TILT_DISABLE) {
   555							input_report_abs(inputdev,
   556									 ABS_TILT_X,
   557									 aiptek->curSetting.xTilt);
   558						}
   559						if (aiptek->curSetting.yTilt != AIPTEK_TILT_DISABLE) {
   560							input_report_abs(inputdev,
   561									 ABS_TILT_Y,
   562									 aiptek->curSetting.yTilt);
   563						}
   564	
   565						/* Wheel support is in the form of a single-event
   566						 * firing.
   567						 */
   568						if (aiptek->curSetting.wheel !=
   569						    AIPTEK_WHEEL_DISABLE) {
   570							input_report_abs(inputdev,
   571									 ABS_WHEEL,
   572									 aiptek->curSetting.wheel);
   573							aiptek->curSetting.wheel = AIPTEK_WHEEL_DISABLE;
   574						}
   575					}
   576					input_report_abs(inputdev, ABS_MISC, p | AIPTEK_REPORT_TOOL_STYLUS);
   577					if (aiptek->lastMacro != -1) {
   578				                input_report_key(inputdev,
   579								 macroKeyEvents[aiptek->lastMacro], 0);
   580						aiptek->lastMacro = -1;
   581					}
   582					input_sync(inputdev);
   583				}
   584			}
   585		}
   586		/* Report 3's come from the mouse in absolute mode.
   587		 */
   588		else if (data[0] == 3) {
   589			if (aiptek->curSetting.coordinateMode == AIPTEK_COORDINATE_RELATIVE_MODE) {
   590				aiptek->diagnostic = AIPTEK_DIAGNOSTIC_SENDING_ABSOLUTE_IN_RELATIVE;
   591			} else if (!AIPTEK_POINTER_ALLOW_MOUSE_MODE
   592				(aiptek->curSetting.pointerMode)) {
   593				aiptek->diagnostic = AIPTEK_DIAGNOSTIC_TOOL_DISALLOWED;
   594			} else {
   595				x = get_unaligned_le16(data + 1);
   596				y = get_unaligned_le16(data + 3);
   597	
   598				jitterable = data[5] & 0x1c;
   599	
   600				dv = (data[5] & 0x01) != 0 ? 1 : 0;
   601				p = (data[5] & 0x02) != 0 ? 1 : 0;
   602				left = (data[5] & aiptek->curSetting.mouseButtonLeft) != 0 ? 1 : 0;
   603				right = (data[5] & aiptek->curSetting.mouseButtonRight) != 0 ? 1 : 0;
   604				middle = (data[5] & aiptek->curSetting.mouseButtonMiddle) != 0 ? 1 : 0;
   605	
   606				if (dv != 0) {
   607					/* If the selected tool changed, reset the old
   608					 * tool key, and set the new one.
   609					 */
   610					if (aiptek->previousToolMode !=
   611					    aiptek->curSetting.toolMode) {
   612					        input_report_key(inputdev,
   613								 aiptek->previousToolMode, 0);
   614						input_report_key(inputdev,
   615								 aiptek->curSetting.toolMode,
   616								 1);
   617						aiptek->previousToolMode =
   618						          aiptek->curSetting.toolMode;
   619					}
   620	
   621					if (p != 0) {
   622						input_report_abs(inputdev, ABS_X, x);
   623						input_report_abs(inputdev, ABS_Y, y);
   624	
   625						input_report_key(inputdev, BTN_LEFT, left);
   626						input_report_key(inputdev, BTN_MIDDLE, middle);
   627						input_report_key(inputdev, BTN_RIGHT, right);
   628	
   629						/* Wheel support is in the form of a single-event
   630						 * firing.
   631						 */
   632						if (aiptek->curSetting.wheel != AIPTEK_WHEEL_DISABLE) {
   633							input_report_abs(inputdev,
   634									 ABS_WHEEL,
   635									 aiptek->curSetting.wheel);
   636							aiptek->curSetting.wheel = AIPTEK_WHEEL_DISABLE;
   637						}
   638					}
   639					input_report_abs(inputdev, ABS_MISC, p | AIPTEK_REPORT_TOOL_MOUSE);
   640					if (aiptek->lastMacro != -1) {
   641				                input_report_key(inputdev,
   642								 macroKeyEvents[aiptek->lastMacro], 0);
   643					        aiptek->lastMacro = -1;
   644					}
   645					input_sync(inputdev);
   646				}
   647			}
   648		}
   649		/* Report 4s come from the macro keys when pressed by stylus
   650		 */
   651		else if (data[0] == 4) {
   652			jitterable = data[1] & 0x18;
   653	
   654			dv = (data[1] & 0x01) != 0 ? 1 : 0;
   655			p = (data[1] & 0x02) != 0 ? 1 : 0;
   656			tip = (data[1] & 0x04) != 0 ? 1 : 0;
   657			bs = (data[1] & aiptek->curSetting.stylusButtonLower) != 0 ? 1 : 0;
   658			pck = (data[1] & aiptek->curSetting.stylusButtonUpper) != 0 ? 1 : 0;
   659	
   660			macro = dv && p && tip && !(data[3] & 1) ? (data[3] >> 1) : -1;
   661			z = get_unaligned_le16(data + 4);
   662	
   663			if (dv) {
   664			        /* If the selected tool changed, reset the old
   665				 * tool key, and set the new one.
   666				 */
   667			        if (aiptek->previousToolMode !=
   668				    aiptek->curSetting.toolMode) {
   669				        input_report_key(inputdev,
   670							 aiptek->previousToolMode, 0);
   671					input_report_key(inputdev,
   672							 aiptek->curSetting.toolMode,
   673							 1);
   674					aiptek->previousToolMode =
   675					        aiptek->curSetting.toolMode;
   676				}
   677			}
   678	
   679			if (aiptek->lastMacro != -1 && aiptek->lastMacro != macro) {
   680			        input_report_key(inputdev, macroKeyEvents[aiptek->lastMacro], 0);
   681				aiptek->lastMacro = -1;
   682			}
   683	
   684			if (macro != -1 && macro != aiptek->lastMacro) {
   685				input_report_key(inputdev, macroKeyEvents[macro], 1);
   686				aiptek->lastMacro = macro;
   687			}
   688			input_report_abs(inputdev, ABS_MISC,
   689					 p | AIPTEK_REPORT_TOOL_STYLUS);
   690			input_sync(inputdev);
   691		}
   692		/* Report 5s come from the macro keys when pressed by mouse
   693		 */
   694		else if (data[0] == 5) {
   695			jitterable = data[1] & 0x1c;
   696	
   697			dv = (data[1] & 0x01) != 0 ? 1 : 0;
   698			p = (data[1] & 0x02) != 0 ? 1 : 0;
   699			left = (data[1]& aiptek->curSetting.mouseButtonLeft) != 0 ? 1 : 0;
   700			right = (data[1] & aiptek->curSetting.mouseButtonRight) != 0 ? 1 : 0;
   701			middle = (data[1] & aiptek->curSetting.mouseButtonMiddle) != 0 ? 1 : 0;
   702			macro = dv && p && left && !(data[3] & 1) ? (data[3] >> 1) : 0;
   703	
   704			if (dv) {
   705			        /* If the selected tool changed, reset the old
   706				 * tool key, and set the new one.
   707				 */
   708			        if (aiptek->previousToolMode !=
   709				    aiptek->curSetting.toolMode) {
   710			                input_report_key(inputdev,
   711							 aiptek->previousToolMode, 0);
   712				        input_report_key(inputdev,
   713							 aiptek->curSetting.toolMode, 1);
   714				        aiptek->previousToolMode = aiptek->curSetting.toolMode;
   715				}
   716			}
   717	
   718			if (aiptek->lastMacro != -1 && aiptek->lastMacro != macro) {
   719			        input_report_key(inputdev, macroKeyEvents[aiptek->lastMacro], 0);
   720				aiptek->lastMacro = -1;
   721			}
   722	
   723			if (macro != -1 && macro != aiptek->lastMacro) {
   724				input_report_key(inputdev, macroKeyEvents[macro], 1);
   725				aiptek->lastMacro = macro;
   726			}
   727	
   728			input_report_abs(inputdev, ABS_MISC,
   729					 p | AIPTEK_REPORT_TOOL_MOUSE);
   730			input_sync(inputdev);
   731		}
   732		/* We have no idea which tool can generate a report 6. Theoretically,
   733		 * neither need to, having been given reports 4 & 5 for such use.
   734		 * However, report 6 is the 'official-looking' report for macroKeys;
   735		 * reports 4 & 5 supposively are used to support unnamed, unknown
   736		 * hat switches (which just so happen to be the macroKeys.)
   737		 */
   738		else if (data[0] == 6) {
   739			macro = get_unaligned_le16(data + 1);
   740			if (macro > 0 && macro < 34) {
   741				input_report_key(inputdev, macroKeyEvents[macro - 1],
   742						 0);
   743			}
 > 744			if (marco > 0 && macro < 25) {
   745				input_report_key(inputdev, macroKeyEvents[macro + 1],
   746						 0);
   747			}
   748	
   749			/* If the selected tool changed, reset the old
   750			   tool key, and set the new one.
   751			*/
   752			if (aiptek->previousToolMode !=
   753			    aiptek->curSetting.toolMode) {
   754			        input_report_key(inputdev,
   755						 aiptek->previousToolMode, 0);
   756				input_report_key(inputdev,
   757						 aiptek->curSetting.toolMode,
   758						 1);
   759				aiptek->previousToolMode =
   760					aiptek->curSetting.toolMode;
   761			}
   762	
   763			if (macro > 0 && macro < 33)
   764				input_report_key(inputdev, macroKeyEvents[macro], 1);
   765			input_report_abs(inputdev, ABS_MISC,
   766					 1 | AIPTEK_REPORT_TOOL_UNKNOWN);
   767			input_sync(inputdev);
   768		} else {
   769			dev_dbg(&intf->dev, "Unknown report %d\n", data[0]);
   770		}
   771	
   772		/* Jitter may occur when the user presses a button on the stlyus
   773		 * or the mouse. What we do to prevent that is wait 'x' milliseconds
   774		 * following a 'jitterable' event, which should give the hand some time
   775		 * stabilize itself.
   776		 *
   777		 * We just introduced aiptek->previousJitterable to carry forth the
   778		 * notion that jitter occurs when the button state changes from on to off:
   779		 * a person drawing, holding a button down is not subject to jittering.
   780		 * With that in mind, changing from upper button depressed to lower button
   781		 * WILL transition through a jitter delay.
   782		 */
   783	
   784		if (aiptek->previousJitterable != jitterable &&
   785		    aiptek->curSetting.jitterDelay != 0 && aiptek->inDelay != 1) {
   786			aiptek->endDelay = jiffies +
   787			    ((aiptek->curSetting.jitterDelay * HZ) / 1000);
   788			aiptek->inDelay = 1;
   789		}
   790		aiptek->previousJitterable = jitterable;
   791	
   792	exit:
   793		retval = usb_submit_urb(urb, GFP_ATOMIC);
   794		if (retval != 0) {
   795			dev_err(&intf->dev,
   796				"%s - usb_submit_urb failed with result %d\n",
   797				__func__, retval);
   798		}
   799	}
   800	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--vtzGhvizbBRQ85DL
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
3H2JcLGdgJu99l3cPqJITnPp+jfhnHE1OBMCAA==

--vtzGhvizbBRQ85DL--
