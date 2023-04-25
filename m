Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1AF6EEB1E
	for <lists+linux-input@lfdr.de>; Wed, 26 Apr 2023 01:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237162AbjDYXvT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Apr 2023 19:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237161AbjDYXvS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Apr 2023 19:51:18 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF027B21D
        for <linux-input@vger.kernel.org>; Tue, 25 Apr 2023 16:51:16 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-52863157da6so1552749a12.0
        for <linux-input@vger.kernel.org>; Tue, 25 Apr 2023 16:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=swiecki.net; s=google; t=1682466676; x=1685058676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wPrtfWaUcVMeBnDoeJQA0UWkCHFbSHRrMboC1XM6pgI=;
        b=cI8SFvOzt8K+/1qs0KIgMaBq5lZGdG0nOlRMAB6PkPT0btTHe0atDNOD4W0RLg8ZuO
         1E6/rQu+N/Yxlnyxr1qj0vvzvo565n5N71dSrNFZ3APBkBDrRWTQpH0Lo/hTjSzno1hO
         eJCWxbIqWi/9OWu8Mq941y6xS15fIv0i90HPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682466676; x=1685058676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPrtfWaUcVMeBnDoeJQA0UWkCHFbSHRrMboC1XM6pgI=;
        b=hXATy0raDVbJ08390ac3N7DcH9zOv1zYFaUJKooYM9yVtLmHeEH/cXZiJhH4eM6Uwg
         wLKWyFxa8uOeD6OwS7Uo/zlkTv35bHEji8b/wX3FP7QLOarm5cGCsqrbOFGO22ZXIZLh
         iTsdLG1MCzTMy8dJCZrAEzl5VQOb40xrlhpaKo/JZXqhxIz/gJsv0iHXLeDE4vtcj3bQ
         KMWDAhc1/IYEDD8nFY2Gq5MZmNeSLDTp0ImtRmtfYabcWNtga2rgtJnv7x4R0MWDqbWO
         5ZFr0q7kcV8AmQZ3uayIDemU+SbXR7VUMTcOlvn82+OHbia1bogmmZAPisav7dwsxwQj
         nO2A==
X-Gm-Message-State: AAQBX9fjI2UBWygK4QN3XcctpZVkOcR82+ZLNFxRQS8tSWKMAyxB0V5E
        K1XJK6hpmdQA9pa6xyzbFcBM8M7X10Z9iBYN/vw+5MyqRTr0lTQKWRY=
X-Google-Smtp-Source: AKy350a9GVeeTOaCRLphiBFBE30FzYIG6hTHN8QI8iToa1OvzlX0IsWDfA/t3tHel5q0w3gG6LZXzHT6VoQleDdVLvg=
X-Received: by 2002:a17:902:eb87:b0:1a7:c058:a167 with SMTP id
 q7-20020a170902eb8700b001a7c058a167mr18343889plg.25.1682466675976; Tue, 25
 Apr 2023 16:51:15 -0700 (PDT)
MIME-Version: 1.0
From:   Robert Swiecki <robert@swiecki.net>
Date:   Wed, 26 Apr 2023 01:51:05 +0200
Message-ID: <CAP145pi2dYbe_6NCe9RKpaa3643-h9iOZi8evXPFmd+8-mZgKQ@mail.gmail.com>
Subject: 8bitdo usb adapter 2 in the NintendoMode (hid-nintendo.ko)
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
Cc:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Daniel and linux-input@vger.kernel.org,

I've recently bought a 8bitdo usb adapter 2 -
https://www.8bitdo.com/usb-wireless-adapter-2/ - and it didn't work
with Linux in its Nintendo Switch Pro mode (emulating the Nintendo Pro
Controller over the USB).

It turned out that the following func sends 2 bytes in the
JC_OUTPUT_USB_CMD, while the adapter expects 64 bytes. Maybe it
expects fewer, but that's what the yuzu emulator sends to it over
hidraw (bypassing the hid-nintendo), and it works.

static int joycon_send_usb(struct joycon_ctlr *ctlr, u8 cmd, u32 timeout)
{
  int ret;
  u8 buf[2] =3D {JC_OUTPUT_USB_CMD};

  buf[1] =3D cmd;
   ctlr->usb_ack_match =3D cmd;
  ctlr->msg_type =3D JOYCON_MSG_TYPE_USB;
  ret =3D joycon_hid_send_sync(ctlr, buf, sizeof(buf), timeout);
  if (ret)
   hid_dbg(ctlr->hdev, "send usb command failed; ret=3D%d\n", ret);
  return ret;
}

If only 2 bytes are sent, then it causes the adapter to disconnect,
probably due to some desync on the protocol level on the adapter side
of things.

[135278.921421] nintendo 0003:057E:2009.00DD: hidraw16: USB HID v81.11
Joystick [Nintendo Co., Ltd. Pro Controller] on
usb-0000:07:00.3-3.1/input0
[135280.000469] nintendo 0003:057E:2009.00DD: failed reading SPI flash; ret=
=3D-71
[135280.000473] nintendo 0003:057E:2009.00DD: using factory cal for left st=
ick
[135280.008470] nintendo 0003:057E:2009.00DD: failed reading SPI flash; ret=
=3D-71
[135280.008473] nintendo 0003:057E:2009.00DD: using factory cal for right s=
tick
[135280.016469] nintendo 0003:057E:2009.00DD: failed reading SPI flash; ret=
=3D-71
[135280.016472] nintendo 0003:057E:2009.00DD: Failed to read left
stick cal, using defaults; e=3D-71
[135280.024468] nintendo 0003:057E:2009.00DD: failed reading SPI flash; ret=
=3D-71
[135280.024471] nintendo 0003:057E:2009.00DD: Failed to read right
stick cal, using defaults; e=3D-71
[135280.032470] nintendo 0003:057E:2009.00DD: failed reading SPI flash; ret=
=3D-71
[135280.032473] nintendo 0003:057E:2009.00DD: using factory cal for IMU
[135280.040468] nintendo 0003:057E:2009.00DD: failed reading SPI flash; ret=
=3D-71
[135280.040471] nintendo 0003:057E:2009.00DD: Failed to read IMU cal,
using defaults; ret=3D-71
[135280.040472] nintendo 0003:057E:2009.00DD: Unable to read IMU
calibration data
[135280.048470] nintendo 0003:057E:2009.00DD: Failed to set report mode; re=
t=3D-71
[135280.048743] nintendo 0003:057E:2009.00DD: probe - fail =3D -71
[135280.048749] nintendo: probe of 0003:057E:2009.00DD failed with error -7=
1
[135280.050014] usb 3-3.1: USB disconnect, device number 53

In case it didn't create any problems with the actual Nintendo Pro
Controller, nor with the JoyCons, could we change this code from

u8 buf[2] =3D {JC_OUTPUT_USB_CMD};

to

u8 buf[64] =3D {JC_OUTPUT_USB_CMD};

?

I know this change is a bit "out of the blue", but given that the
protocol seems to be generally undocumented and reverse-engineered,
maybe that's fine here.

Thanks in advance.

--=20
Robert =C5=9Awi=C4=99cki
