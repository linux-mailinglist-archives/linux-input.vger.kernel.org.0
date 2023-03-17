Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B45C6BED8E
	for <lists+linux-input@lfdr.de>; Fri, 17 Mar 2023 17:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231473AbjCQQAa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Mar 2023 12:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231415AbjCQQAZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Mar 2023 12:00:25 -0400
Received: from mail-yw1-x1143.google.com (mail-yw1-x1143.google.com [IPv6:2607:f8b0:4864:20::1143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E93262D88
        for <linux-input@vger.kernel.org>; Fri, 17 Mar 2023 09:00:22 -0700 (PDT)
Received: by mail-yw1-x1143.google.com with SMTP id 00721157ae682-5447d217bc6so102390227b3.7
        for <linux-input@vger.kernel.org>; Fri, 17 Mar 2023 09:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679068821;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6+ydN9l/SJPYZRtwtvqhoGmqEqRzzK6DZEsBcKrNuRE=;
        b=IVMvJpOf5lp3HN8xefqembA14SPz/9b6m/1j3X/7LaDohLm9L1yMXnyoANoB1TYXuq
         Y2+f7JOnsAMAoEl8RDqzwuRfYmlc/vShz7KSiayW0nmgEyc02ZQm+f9TB31+hTF47Rem
         xRPjPJl7RuCXsPb/qdRbtH6KGJieafScLFZQszcQaqJJLuVmjT9YuTntx60eahz9RKWd
         kzeewRC4s1M88SQ6OpLK98PnGWbtyMJxPkUJXW214WvRp8HKEWhh2XMis0hSwjzdI1G1
         02m/xdjgFA37XtxFxPyxs3g4jf6qQ3XyOTIdA1CL+6rcNCb8i6jn4TlO9K6r1Viz2yXO
         e4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679068821;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6+ydN9l/SJPYZRtwtvqhoGmqEqRzzK6DZEsBcKrNuRE=;
        b=oqcY7O4DHDnQvFoMOuo8n9QNcrQFqzJlYXwYe0uaRS1kWyRx9S8vrUxkxIHpgVNi4x
         TbFGEX/k+6hYJgKHcbNmahEjKGFuOzFjuBn4Ng37CpsP4waXIifBWimPYJwiDD4eyIbq
         fY+fx3tC0kJE6k1iaXDZ077WOpFT9/SExqPrudky4hX7vo5XUfQODFu5x1bzGmOiLAki
         6pOkK+imBv5mnXHh+3Mbp5Fl+jgOXQJyaI7OgGuxo5Ms1nEuGUGHe+tfRNT9kXzz8C/W
         cTt68C0S/IT0X15g1ZFVAUw9VzS+ThP81ufTOT/Hn6hG15ULQgY9feiE2niNXeWWWXmV
         OTIA==
X-Gm-Message-State: AO0yUKWZ1r85WyYY20+aJmmM61mubTMSeuzBYvsDCIdCWLcO6J7Qb+jE
        S28W4sH1W5SZQxpF4FXmbUHbCU26Kr/zbTD4hGteRG3p4/UMqA==
X-Google-Smtp-Source: AK7set8SWLtPwDFhRSJawFVZWwON+qH37Q1HGTZg3eYaDCNRWCmweivmx31sMiENQVF2QOfql6+yWWuP22dI/zlWcZs=
X-Received: by 2002:a81:a906:0:b0:52e:d2a7:1ba1 with SMTP id
 g6-20020a81a906000000b0052ed2a71ba1mr4594656ywh.1.1679068821435; Fri, 17 Mar
 2023 09:00:21 -0700 (PDT)
MIME-Version: 1.0
From:   Matthias Benkmann <matthias.benkmann@gmail.com>
Date:   Fri, 17 Mar 2023 17:00:10 +0100
Message-ID: <CAK4gqCBiDiVQ-q8x_JjZ4ZY5UKr81foA_aa5YwZsE0yFarBtzA@mail.gmail.com>
Subject: [PATCH] Fix incorrectly applied patch for MAP_PROFILE_BUTTON
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Original
 patch can be seen here:
 https://lore.kernel.org/all/20220908173930.28940-6-nate@yocom.org/ The hunk
 in question was supposed to go into xpad**ONE**_process_packet(), but ended
 up in xpad_process_packet(). This fix is based on visual inspection only. I
 do not have the hardware to verify that it works. I CAN confidently say,
 however, that the old code could not possibly have worked, because the
 function xpad_process_packet() is not called for the Microsoft X-Box Adaptive
 Controller since it is tagged as XTYPE_XBOXONE. So at least this fix does not
 break something that worked.

---
 drivers/input/joystick/xpad.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index f642ec8e92dd..29131f1a2f06 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -781,9 +781,6 @@ static void xpad_process_packet(struct usb_xpad
*xpad, u16 cmd, unsigned char *d
  input_report_key(dev, BTN_C, data[8]);
  input_report_key(dev, BTN_Z, data[9]);

- /* Profile button has a value of 0-3, so it is reported as an axis */
- if (xpad->mapping & MAP_PROFILE_BUTTON)
- input_report_abs(dev, ABS_PROFILE, data[34]);

  input_sync(dev);
 }
@@ -1061,6 +1058,10 @@ static void xpadone_process_packet(struct
usb_xpad *xpad, u16 cmd, unsigned char
  (__u16) le16_to_cpup((__le16 *)(data + 8)));
  }

+ /* Profile button has a value of 0-3, so it is reported as an axis */
+ if (xpad->mapping & MAP_PROFILE_BUTTON)
+ input_report_abs(dev, ABS_PROFILE, data[34]);
+
  /* paddle handling */
  /* based on SDL's SDL_hidapi_xboxone.c */
  if (xpad->mapping & MAP_PADDLES) {
-- 
2.25.1
