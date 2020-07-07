Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB9442175C8
	for <lists+linux-input@lfdr.de>; Tue,  7 Jul 2020 20:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbgGGSDe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jul 2020 14:03:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:56380 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727777AbgGGSDd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Jul 2020 14:03:33 -0400
Received: from embeddedor (unknown [200.39.26.250])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E1698206E2;
        Tue,  7 Jul 2020 18:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594145012;
        bh=QIXsynOoPRtkR6A31QQF8nnFyGDnLMUTmVQQWqVo09o=;
        h=Date:From:To:Cc:Subject:From;
        b=yr9bQOIa8ChNIieQmwigilgAjFX3jQqewAUJgBrw+/527rs494MJR3i+l9Z+1xW/Y
         EeDZrF9FYcurBKcdTJZHYHMsnQ9n1bdkBQ5zFGaIA6zV0PQvTVxAr36YJSLxT+o87p
         rydJ5z9INA6f6AoQui0OUNJANTgFNCdvalfIlV4M=
Date:   Tue, 7 Jul 2020 13:08:57 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH][next] Input: Use fallthrough pseudo-keyword
Message-ID: <20200707180857.GA30600@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Replace the existing /* fall through */ comments and its variants with
the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
fall-through markings when it is the case.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/input/joystick/db9.c             | 10 +++++-----
 drivers/input/joystick/gamecon.c         | 10 ++++++----
 drivers/input/joystick/sidewinder.c      | 15 ++++++++++-----
 drivers/input/joystick/spaceball.c       |  8 ++++----
 drivers/input/keyboard/adp5589-keys.c    |  2 +-
 drivers/input/keyboard/atkbd.c           |  2 +-
 drivers/input/keyboard/gpio_keys.c       |  1 -
 drivers/input/misc/iqs269a.c             | 21 +++++++--------------
 drivers/input/misc/pwm-vibra.c           |  2 +-
 drivers/input/misc/xen-kbdfront.c        |  4 ++--
 drivers/input/mouse/appletouch.c         |  2 +-
 drivers/input/mouse/cyapa_gen3.c         |  4 ++--
 drivers/input/mouse/cyapa_gen5.c         |  2 +-
 drivers/input/mouse/cyapa_gen6.c         |  2 +-
 drivers/input/mouse/elantech.c           |  6 ++----
 drivers/input/mouse/hgpk.c               |  4 ++--
 drivers/input/mouse/navpoint.c           |  2 +-
 drivers/input/mouse/sentelic.c           |  2 +-
 drivers/input/mouse/sermouse.c           |  4 ++--
 drivers/input/serio/i8042.c              |  2 +-
 drivers/input/serio/libps2.c             |  2 +-
 drivers/input/sparse-keymap.c            |  2 +-
 drivers/input/tablet/gtco.c              |  6 +++---
 drivers/input/tablet/pegasus_notetaker.c |  2 +-
 drivers/input/touchscreen/edt-ft5x06.c   |  3 +--
 drivers/input/touchscreen/elants_i2c.c   |  2 +-
 drivers/input/touchscreen/elo.c          |  2 +-
 drivers/input/touchscreen/iqs5xx.c       |  2 +-
 drivers/input/touchscreen/max11801_ts.c  |  1 -
 drivers/input/touchscreen/stmfts.c       |  2 +-
 30 files changed, 62 insertions(+), 67 deletions(-)

diff --git a/drivers/input/joystick/db9.c b/drivers/input/joystick/db9.c
index a7bc576eb342..434d265fa2e8 100644
--- a/drivers/input/joystick/db9.c
+++ b/drivers/input/joystick/db9.c
@@ -247,7 +247,7 @@ static unsigned char db9_saturn_read_packet(struct parport *port, unsigned char
 			db9_saturn_write_sub(port, type, 3, powered, 0);
 			return data[0] = 0xe3;
 		}
-		/* fall through */
+		fallthrough;
 	default:
 		return data[0];
 	}
@@ -267,14 +267,14 @@ static int db9_saturn_report(unsigned char id, unsigned char data[60], struct in
 		switch (data[j]) {
 		case 0x16: /* multi controller (analog 4 axis) */
 			input_report_abs(dev, db9_abs[5], data[j + 6]);
-			/* fall through */
+			fallthrough;
 		case 0x15: /* mission stick (analog 3 axis) */
 			input_report_abs(dev, db9_abs[3], data[j + 4]);
 			input_report_abs(dev, db9_abs[4], data[j + 5]);
-			/* fall through */
+			fallthrough;
 		case 0x13: /* racing controller (analog 1 axis) */
 			input_report_abs(dev, db9_abs[2], data[j + 3]);
-			/* fall through */
+			fallthrough;
 		case 0x34: /* saturn keyboard (udlr ZXC ASD QE Esc) */
 		case 0x02: /* digital pad (digital 2 axis + buttons) */
 			input_report_abs(dev, db9_abs[0], !(data[j + 1] & 128) - !(data[j + 1] & 64));
@@ -368,7 +368,7 @@ static void db9_timer(struct timer_list *t)
 			input_report_abs(dev2, ABS_X, (data & DB9_RIGHT ? 0 : 1) - (data & DB9_LEFT ? 0 : 1));
 			input_report_abs(dev2, ABS_Y, (data & DB9_DOWN  ? 0 : 1) - (data & DB9_UP   ? 0 : 1));
 			input_report_key(dev2, BTN_TRIGGER, ~data & DB9_FIRE1);
-			/* fall through */
+			fallthrough;
 
 		case DB9_MULTI_0802:
 
diff --git a/drivers/input/joystick/gamecon.c b/drivers/input/joystick/gamecon.c
index e0a362be5812..88df68cc4ac6 100644
--- a/drivers/input/joystick/gamecon.c
+++ b/drivers/input/joystick/gamecon.c
@@ -485,7 +485,7 @@ static void gc_multi_process_packet(struct gc *gc)
 		switch (pad->type) {
 		case GC_MULTI2:
 			input_report_key(dev, BTN_THUMB, s & data[5]);
-			/* fall through */
+			fallthrough;
 
 		case GC_MULTI:
 			input_report_abs(dev, ABS_X,
@@ -638,7 +638,7 @@ static void gc_psx_report_one(struct gc_pad *pad, unsigned char psx_type,
 
 		input_report_key(dev, BTN_THUMBL, ~data[0] & 0x04);
 		input_report_key(dev, BTN_THUMBR, ~data[0] & 0x02);
-		/* fall through */
+		fallthrough;
 
 	case GC_PSX_NEGCON:
 	case GC_PSX_ANALOG:
@@ -872,7 +872,8 @@ static int gc_setup_pad(struct gc *gc, int idx, int pad_type)
 	case GC_SNES:
 		for (i = 4; i < 8; i++)
 			input_set_capability(input_dev, EV_KEY, gc_snes_btn[i]);
-		/* fall through */
+		fallthrough;
+
 	case GC_NES:
 		for (i = 0; i < 4; i++)
 			input_set_capability(input_dev, EV_KEY, gc_snes_btn[i]);
@@ -880,7 +881,8 @@ static int gc_setup_pad(struct gc *gc, int idx, int pad_type)
 
 	case GC_MULTI2:
 		input_set_capability(input_dev, EV_KEY, BTN_THUMB);
-		/* fall through */
+		fallthrough;
+
 	case GC_MULTI:
 		input_set_capability(input_dev, EV_KEY, BTN_TRIGGER);
 		/* fall through */
diff --git a/drivers/input/joystick/sidewinder.c b/drivers/input/joystick/sidewinder.c
index 1777e68c9f02..fac91ea14f17 100644
--- a/drivers/input/joystick/sidewinder.c
+++ b/drivers/input/joystick/sidewinder.c
@@ -656,16 +656,19 @@ static int sw_connect(struct gameport *gameport, struct gameport_driver *drv)
 
 			switch (i * m) {
 				case 60:
-					sw->number++;			/* fall through */
+					sw->number++;
+					fallthrough;
 				case 45:				/* Ambiguous packet length */
 					if (j <= 40) {			/* ID length less or eq 40 -> FSP */
 				case 43:
 						sw->type = SW_ID_FSP;
 						break;
 					}
-					sw->number++;			/* fall through */
+					sw->number++;
+					fallthrough;
 				case 30:
-					sw->number++;			/* fall through */
+					sw->number++;
+					fallthrough;
 				case 15:
 					sw->type = SW_ID_GP;
 					break;
@@ -681,9 +684,11 @@ static int sw_connect(struct gameport *gameport, struct gameport_driver *drv)
 						sw->type = SW_ID_PP;
 					break;
 				case 66:
-					sw->bits = 3;			/* fall through */
+					sw->bits = 3;
+					fallthrough;
 				case 198:
-					sw->length = 22;		/* fall through */
+					sw->length = 22;
+					fallthrough;
 				case 64:
 					sw->type = SW_ID_3DP;
 					if (j == 160)
diff --git a/drivers/input/joystick/spaceball.c b/drivers/input/joystick/spaceball.c
index cf7cbcd0c29d..429411c6c0a8 100644
--- a/drivers/input/joystick/spaceball.c
+++ b/drivers/input/joystick/spaceball.c
@@ -146,7 +146,7 @@ static irqreturn_t spaceball_interrupt(struct serio *serio,
 				break;
 			}
 			spaceball->escape = 0;
-			/* fall through */
+			fallthrough;
 		case 'M':
 		case 'Q':
 		case 'S':
@@ -154,7 +154,7 @@ static irqreturn_t spaceball_interrupt(struct serio *serio,
 				spaceball->escape = 0;
 				data &= 0x1f;
 			}
-			/* fall through */
+			fallthrough;
 		default:
 			if (spaceball->escape)
 				spaceball->escape = 0;
@@ -220,13 +220,13 @@ static int spaceball_connect(struct serio *serio, struct serio_driver *drv)
 			input_dev->keybit[BIT_WORD(BTN_A)] |= BIT_MASK(BTN_A) |
 				BIT_MASK(BTN_B) | BIT_MASK(BTN_C) |
 				BIT_MASK(BTN_MODE);
-			/* fall through */
+			fallthrough;
 		default:
 			input_dev->keybit[BIT_WORD(BTN_0)] |= BIT_MASK(BTN_2) |
 				BIT_MASK(BTN_3) | BIT_MASK(BTN_4) |
 				BIT_MASK(BTN_5) | BIT_MASK(BTN_6) |
 				BIT_MASK(BTN_7) | BIT_MASK(BTN_8);
-			/* fall through */
+			fallthrough;
 		case SPACEBALL_3003C:
 			input_dev->keybit[BIT_WORD(BTN_0)] |= BIT_MASK(BTN_1) |
 				BIT_MASK(BTN_8);
diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index e7d58e7f0257..eb0e9cd66bcb 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -1016,7 +1016,7 @@ static int adp5589_probe(struct i2c_client *client,
 	switch (id->driver_data) {
 	case ADP5585_02:
 		kpad->support_row5 = true;
-		/* fall through */
+		fallthrough;
 	case ADP5585_01:
 		kpad->is_adp5585 = true;
 		kpad->var = &const_adp5585;
diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 6ec28265771d..edc613efc158 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -1241,7 +1241,7 @@ static int atkbd_connect(struct serio *serio, struct serio_driver *drv)
 
 	case SERIO_8042_XL:
 		atkbd->translated = true;
-		/* Fall through */
+		fallthrough;
 
 	case SERIO_8042:
 		if (serio->write)
diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 53c9ff338dea..f2d4e4daa818 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -574,7 +574,6 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 				IRQ_TYPE_EDGE_RISING : IRQ_TYPE_EDGE_FALLING;
 			break;
 		case EV_ACT_ANY:
-			/* fall through */
 		default:
 			/*
 			 * For other cases, we are OK letting suspend/resume
diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
index 6699eb160a0f..a348247d3d38 100644
--- a/drivers/input/misc/iqs269a.c
+++ b/drivers/input/misc/iqs269a.c
@@ -575,8 +575,7 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
 
 		case IQS269_LOCAL_CAP_SIZE_GLOBAL_0pF5:
 			engine_a |= IQS269_CHx_ENG_A_LOCAL_CAP_SIZE;
-
-			/* fall through */
+			fallthrough;
 
 		case IQS269_LOCAL_CAP_SIZE_GLOBAL_ONLY:
 			engine_b |= IQS269_CHx_ENG_B_LOCAL_CAP_ENABLE;
@@ -731,14 +730,12 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
 				iqs269->switches[i].code = val;
 				iqs269->switches[i].enabled = true;
 			}
-
-			/* fall through */
+			fallthrough;
 
 		case IQS269_CHx_HALL_INACTIVE:
 			if (iqs269->hall_enable)
 				break;
-
-			/* fall through */
+			fallthrough;
 
 		default:
 			iqs269->keycode[i * IQS269_NUM_CH + reg] = val;
@@ -1143,14 +1140,12 @@ static int iqs269_input_init(struct iqs269_private *iqs269)
 							    sw_code,
 							    state & BIT(j));
 				}
-
-				/* fall through */
+				fallthrough;
 
 			case IQS269_CHx_HALL_INACTIVE:
 				if (iqs269->hall_enable)
 					continue;
-
-				/* fall through */
+				fallthrough;
 
 			default:
 				if (keycode != KEY_RESERVED)
@@ -1273,14 +1268,12 @@ static int iqs269_report(struct iqs269_private *iqs269)
 					input_report_switch(iqs269->keypad,
 							    sw_code,
 							    state & BIT(j));
-
-				/* fall through */
+				fallthrough;
 
 			case IQS269_CHx_HALL_INACTIVE:
 				if (iqs269->hall_enable)
 					continue;
-
-				/* fall through */
+				fallthrough;
 
 			default:
 				input_report_key(iqs269->keypad, keycode,
diff --git a/drivers/input/misc/pwm-vibra.c b/drivers/input/misc/pwm-vibra.c
index 8ceaf7db2882..81e777a04b88 100644
--- a/drivers/input/misc/pwm-vibra.c
+++ b/drivers/input/misc/pwm-vibra.c
@@ -190,7 +190,7 @@ static int pwm_vibrator_probe(struct platform_device *pdev)
 
 	default:
 		dev_err(&pdev->dev, "Failed to request direction pwm: %d", err);
-		/* Fall through */
+		fallthrough;
 
 	case -EPROBE_DEFER:
 		return err;
diff --git a/drivers/input/misc/xen-kbdfront.c b/drivers/input/misc/xen-kbdfront.c
index a1bba722b234..4ff5cd2a6d8d 100644
--- a/drivers/input/misc/xen-kbdfront.c
+++ b/drivers/input/misc/xen-kbdfront.c
@@ -124,7 +124,7 @@ static void xenkbd_handle_mt_event(struct xenkbd_info *info,
 	switch (mtouch->event_type) {
 	case XENKBD_MT_EV_DOWN:
 		input_mt_report_slot_state(info->mtouch, MT_TOOL_FINGER, true);
-		/* fall through */
+		fallthrough;
 
 	case XENKBD_MT_EV_MOTION:
 		input_report_abs(info->mtouch, ABS_MT_POSITION_X,
@@ -524,7 +524,7 @@ static void xenkbd_backend_changed(struct xenbus_device *dev,
 	case XenbusStateClosed:
 		if (dev->state == XenbusStateClosed)
 			break;
-		/* fall through - Missed the backend's CLOSING state */
+		fallthrough;	/* Missed the backend's CLOSING state */
 	case XenbusStateClosing:
 		xenbus_frontend_closed(dev);
 		break;
diff --git a/drivers/input/mouse/appletouch.c b/drivers/input/mouse/appletouch.c
index 3f06e8a495d8..bfa26651c0be 100644
--- a/drivers/input/mouse/appletouch.c
+++ b/drivers/input/mouse/appletouch.c
@@ -458,7 +458,7 @@ static int atp_status_check(struct urb *urb)
 				dev->info->datalen, dev->urb->actual_length);
 			dev->overflow_warned = true;
 		}
-		/* fall through */
+		fallthrough;
 	case -ECONNRESET:
 	case -ENOENT:
 	case -ESHUTDOWN:
diff --git a/drivers/input/mouse/cyapa_gen3.c b/drivers/input/mouse/cyapa_gen3.c
index 00e395dfc3d5..a0361f9325f8 100644
--- a/drivers/input/mouse/cyapa_gen3.c
+++ b/drivers/input/mouse/cyapa_gen3.c
@@ -1067,7 +1067,7 @@ static int cyapa_gen3_do_operational_check(struct cyapa *cyapa)
 			return error;
 		}
 
-	/* Fall through */
+		fallthrough;
 	case CYAPA_STATE_BL_IDLE:
 		/* Try to get firmware version in bootloader mode. */
 		cyapa_gen3_bl_query_data(cyapa);
@@ -1078,7 +1078,7 @@ static int cyapa_gen3_do_operational_check(struct cyapa *cyapa)
 			return error;
 		}
 
-	/* Fall through */
+		fallthrough;
 	case CYAPA_STATE_OP:
 		/*
 		 * Reading query data before going back to the full mode
diff --git a/drivers/input/mouse/cyapa_gen5.c b/drivers/input/mouse/cyapa_gen5.c
index 7f012bfa2658..bb3a63d1268d 100644
--- a/drivers/input/mouse/cyapa_gen5.c
+++ b/drivers/input/mouse/cyapa_gen5.c
@@ -2554,7 +2554,7 @@ static int cyapa_gen5_do_operational_check(struct cyapa *cyapa)
 		}
 
 		cyapa->state = CYAPA_STATE_GEN5_APP;
-		/* fall through */
+		fallthrough;
 
 	case CYAPA_STATE_GEN5_APP:
 		/*
diff --git a/drivers/input/mouse/cyapa_gen6.c b/drivers/input/mouse/cyapa_gen6.c
index c1b524ab4623..7eba66fbef58 100644
--- a/drivers/input/mouse/cyapa_gen6.c
+++ b/drivers/input/mouse/cyapa_gen6.c
@@ -680,7 +680,7 @@ static int cyapa_gen6_operational_check(struct cyapa *cyapa)
 		}
 
 		cyapa->state = CYAPA_STATE_GEN6_APP;
-		/* fall through */
+		fallthrough;
 
 	case CYAPA_STATE_GEN6_APP:
 		/*
diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 2d8434b7b623..e359e7059e10 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -383,7 +383,7 @@ static void elantech_report_absolute_v2(struct psmouse *psmouse)
 		 */
 		if (packet[3] & 0x80)
 			fingers = 4;
-		/* fall through */
+		fallthrough;
 	case 1:
 		/*
 		 * byte 1:  .   .   .   .  x11 x10 x9  x8
@@ -1146,7 +1146,7 @@ static int elantech_set_input_params(struct psmouse *psmouse)
 	case 2:
 		__set_bit(BTN_TOOL_QUADTAP, dev->keybit);
 		__set_bit(INPUT_PROP_SEMI_MT, dev->propbit);
-		/* fall through */
+		fallthrough;
 	case 3:
 		if (info->hw_version == 3)
 			elantech_set_buttonpad_prop(psmouse);
@@ -1877,12 +1877,10 @@ static bool elantech_use_host_notify(struct psmouse *psmouse,
 		/* expected case */
 		break;
 	case ETP_BUS_SMB_ALERT_ONLY:
-		/* fall-through  */
 	case ETP_BUS_PS2_SMB_ALERT:
 		psmouse_dbg(psmouse, "Ignoring SMBus provider through alert protocol.\n");
 		break;
 	case ETP_BUS_SMB_HST_NTFY_ONLY:
-		/* fall-through  */
 	case ETP_BUS_PS2_SMB_HST_NTFY:
 		return true;
 	default:
diff --git a/drivers/input/mouse/hgpk.c b/drivers/input/mouse/hgpk.c
index 72a083f3fc4a..4dc441309aac 100644
--- a/drivers/input/mouse/hgpk.c
+++ b/drivers/input/mouse/hgpk.c
@@ -238,7 +238,7 @@ static void hgpk_spewing_hack(struct psmouse *psmouse,
 		/* we're not spewing, but this packet might be the start */
 		priv->spew_flag = MAYBE_SPEWING;
 
-		/* fall-through */
+		fallthrough;
 
 	case MAYBE_SPEWING:
 		priv->spew_count++;
@@ -249,7 +249,7 @@ static void hgpk_spewing_hack(struct psmouse *psmouse,
 		/* excessive spew detected, request recalibration */
 		priv->spew_flag = SPEW_DETECTED;
 
-		/* fall-through */
+		fallthrough;
 
 	case SPEW_DETECTED:
 		/* only recalibrate when the overall delta to the cursor
diff --git a/drivers/input/mouse/navpoint.c b/drivers/input/mouse/navpoint.c
index 0b75248c8380..c112980c2341 100644
--- a/drivers/input/mouse/navpoint.c
+++ b/drivers/input/mouse/navpoint.c
@@ -105,7 +105,7 @@ static void navpoint_packet(struct navpoint *navpoint)
 	case 0x19:	/* Module 0, Hello packet */
 		if ((navpoint->data[1] & 0xf0) == 0x10)
 			break;
-		/* FALLTHROUGH */
+		fallthrough;
 	default:
 		dev_warn(navpoint->dev,
 			 "spurious packet: data=0x%02x,0x%02x,...\n",
diff --git a/drivers/input/mouse/sentelic.c b/drivers/input/mouse/sentelic.c
index e99d9bf1a267..9f7ecc72093a 100644
--- a/drivers/input/mouse/sentelic.c
+++ b/drivers/input/mouse/sentelic.c
@@ -794,7 +794,7 @@ static psmouse_ret_t fsp_process_byte(struct psmouse *psmouse)
 		/* on-pad click, filter it if necessary */
 		if ((ad->flags & FSPDRV_FLAG_EN_OPC) != FSPDRV_FLAG_EN_OPC)
 			packet[0] &= ~FSP_PB0_LBTN;
-		/* fall through */
+		fallthrough;
 
 	case FSP_PKT_TYPE_NORMAL:
 		/* normal packet */
diff --git a/drivers/input/mouse/sermouse.c b/drivers/input/mouse/sermouse.c
index ea9242d53899..caa79c177c55 100644
--- a/drivers/input/mouse/sermouse.c
+++ b/drivers/input/mouse/sermouse.c
@@ -128,7 +128,7 @@ static void sermouse_process_ms(struct sermouse *sermouse, signed char data)
 
 				case SERIO_MS:
 					sermouse->type = SERIO_MP;
-					/* fall through */
+					fallthrough;
 
 				case SERIO_MP:
 					if ((data >> 2) & 3) break;	/* M++ Wireless Extension packet. */
@@ -139,7 +139,7 @@ static void sermouse_process_ms(struct sermouse *sermouse, signed char data)
 				case SERIO_MZP:
 				case SERIO_MZPP:
 					input_report_key(dev, BTN_SIDE,   (data >> 5) & 1);
-					/* fall through */
+					fallthrough;
 
 				case SERIO_MZ:
 					input_report_key(dev, BTN_MIDDLE, (data >> 4) & 1);
diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index 0dddf273afd9..d3eda48032e3 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -562,7 +562,7 @@ static irqreturn_t i8042_interrupt(int irq, void *dev_id)
 						str = last_str;
 						break;
 					}
-					/* fall through - report timeout */
+					fallthrough;	/* report timeout */
 				case 0xfc:
 				case 0xfd:
 				case 0xfe: dfl = SERIO_TIMEOUT; data = 0xfe; break;
diff --git a/drivers/input/serio/libps2.c b/drivers/input/serio/libps2.c
index a8c94a940a79..8a16e41f7b7f 100644
--- a/drivers/input/serio/libps2.c
+++ b/drivers/input/serio/libps2.c
@@ -418,7 +418,7 @@ bool ps2_handle_ack(struct ps2dev *ps2dev, u8 data)
 			ps2dev->nak = 0;
 			break;
 		}
-		/* Fall through */
+		fallthrough;
 	default:
 		/*
 		 * Do not signal errors if we get unexpected reply while
diff --git a/drivers/input/sparse-keymap.c b/drivers/input/sparse-keymap.c
index 530fd15eaeca..25bf8be6e711 100644
--- a/drivers/input/sparse-keymap.c
+++ b/drivers/input/sparse-keymap.c
@@ -247,7 +247,7 @@ void sparse_keymap_report_entry(struct input_dev *dev, const struct key_entry *k
 
 	case KE_SW:
 		value = ke->sw.value;
-		/* fall through */
+		fallthrough;
 
 	case KE_VSW:
 		input_report_switch(dev, ke->sw.code, value);
diff --git a/drivers/input/tablet/gtco.c b/drivers/input/tablet/gtco.c
index 96d65575f75a..44bb1f69b4b2 100644
--- a/drivers/input/tablet/gtco.c
+++ b/drivers/input/tablet/gtco.c
@@ -676,8 +676,8 @@ static void gtco_urb_callback(struct urb *urbinfo)
 
 			/* Mask out the Y tilt value used for pressure */
 			device->buffer[7] = (u8)((device->buffer[7]) & 0x7F);
+			fallthrough;
 
-			/* Fall thru */
 		case 4:
 			/* Tilt */
 			input_report_abs(inputdev, ABS_TILT_X,
@@ -685,8 +685,8 @@ static void gtco_urb_callback(struct urb *urbinfo)
 
 			input_report_abs(inputdev, ABS_TILT_Y,
 					 sign_extend32(device->buffer[7], 6));
+			fallthrough;
 
-			/* Fall thru */
 		case 2:
 		case 3:
 			/* Convert buttons, only 5 bits possible */
@@ -695,8 +695,8 @@ static void gtco_urb_callback(struct urb *urbinfo)
 			/* We don't apply any meaning to the bitmask,
 			   just report */
 			input_event(inputdev, EV_MSC, MSC_SERIAL, val);
+			fallthrough;
 
-			/*  Fall thru */
 		case 1:
 			/* All reports have X and Y coords in the same place */
 			val = get_unaligned_le16(&device->buffer[1]);
diff --git a/drivers/input/tablet/pegasus_notetaker.c b/drivers/input/tablet/pegasus_notetaker.c
index 38f087404f7a..749edbdb7ffa 100644
--- a/drivers/input/tablet/pegasus_notetaker.c
+++ b/drivers/input/tablet/pegasus_notetaker.c
@@ -146,7 +146,7 @@ static void pegasus_parse_packet(struct pegasus *pegasus)
 	/* xy data */
 	case BATTERY_LOW:
 		dev_warn_once(&dev->dev, "Pen battery low\n");
-		/* fall through */
+		fallthrough;
 
 	case BATTERY_NO_REPORT:
 	case BATTERY_GOOD:
diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 3a4f18d3450d..6ff81d48da86 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -288,7 +288,7 @@ static int edt_ft5x06_register_write(struct edt_ft5x06_ts_data *tsdata,
 		wrbuf[3] = wrbuf[0] ^ wrbuf[1] ^ wrbuf[2];
 		return edt_ft5x06_ts_readwrite(tsdata->client, 4,
 					wrbuf, 0, NULL);
-	/* fallthrough */
+
 	case EDT_M09:
 	case EDT_M12:
 	case EV_FT:
@@ -330,7 +330,6 @@ static int edt_ft5x06_register_read(struct edt_ft5x06_ts_data *tsdata,
 		}
 		break;
 
-	/* fallthrough */
 	case EDT_M09:
 	case EDT_M12:
 	case EV_FT:
diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 233cb1085bbd..a765aa876a8e 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -955,7 +955,7 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
 			break;
 
 		ts->state = ELAN_STATE_NORMAL;
-		/* fall through */
+		fallthrough;
 
 	case ELAN_STATE_NORMAL:
 
diff --git a/drivers/input/touchscreen/elo.c b/drivers/input/touchscreen/elo.c
index d6772a2c2d09..e0bacd34866a 100644
--- a/drivers/input/touchscreen/elo.c
+++ b/drivers/input/touchscreen/elo.c
@@ -348,7 +348,7 @@ static int elo_connect(struct serio *serio, struct serio_driver *drv)
 
 	case 1: /* 6-byte protocol */
 		input_set_abs_params(input_dev, ABS_PRESSURE, 0, 15, 0, 0);
-		/* fall through */
+		fallthrough;
 
 	case 2: /* 4-byte protocol */
 		input_set_abs_params(input_dev, ABS_X, 96, 4000, 0, 0);
diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index 5875bb1099a8..3162b68f7374 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -289,7 +289,7 @@ static int iqs5xx_bl_cmd(struct i2c_client *client, u8 bl_cmd, u16 bl_addr)
 		break;
 	case IQS5XX_BL_CMD_EXEC:
 		usleep_range(10000, 10100);
-		/* fall through */
+		fallthrough;
 	default:
 		return 0;
 	}
diff --git a/drivers/input/touchscreen/max11801_ts.c b/drivers/input/touchscreen/max11801_ts.c
index 1af08d3dfaf7..f15713aaebc2 100644
--- a/drivers/input/touchscreen/max11801_ts.c
+++ b/drivers/input/touchscreen/max11801_ts.c
@@ -130,7 +130,6 @@ static irqreturn_t max11801_ts_interrupt(int irq, void *dev_id)
 
 		switch (buf[1] & EVENT_TAG_MASK) {
 		case EVENT_INIT:
-			/* fall through */
 		case EVENT_MIDDLE:
 			input_report_abs(data->input_dev, ABS_X, x);
 			input_report_abs(data->input_dev, ABS_Y, y);
diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index b54cc64e4ea6..df946869d4cd 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -255,7 +255,7 @@ static void stmfts_parse_events(struct stmfts_data *sdata)
 		case STMFTS_EV_SLEEP_OUT_CONTROLLER_READY:
 		case STMFTS_EV_STATUS:
 			complete(&sdata->cmd_done);
-			/* fall through */
+			fallthrough;
 
 		case STMFTS_EV_NO_EVENT:
 		case STMFTS_EV_DEBUG:
-- 
2.27.0

