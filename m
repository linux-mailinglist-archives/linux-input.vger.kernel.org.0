Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8416205763
	for <lists+linux-input@lfdr.de>; Tue, 23 Jun 2020 18:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732475AbgFWQkC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Jun 2020 12:40:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732174AbgFWQkB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Jun 2020 12:40:01 -0400
Received: from gnutoo.cyberdimension.org (cyberdimension.org [IPv6:2001:910:1314:ffff::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2D9CC061573
        for <linux-input@vger.kernel.org>; Tue, 23 Jun 2020 09:40:00 -0700 (PDT)
Received: from gnutoo.cyberdimension.org (localhost [127.0.0.1])
        by cyberdimension.org (OpenSMTPD) with ESMTP id e662e01c;
        Tue, 23 Jun 2020 16:31:38 +0000 (UTC)
Received: from primarylaptop.localdomain (localhost.localdomain [::1])
        by gnutoo.cyberdimension.org (OpenSMTPD) with ESMTP id c4c2bd65;
        Tue, 23 Jun 2020 16:31:38 +0000 (UTC)
Date:   Tue, 23 Jun 2020 18:25:45 +0200
From:   Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
To:     Peter Hutterer <peter.hutterer@who-t.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Andi Shyti <andi@etezian.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-input@vger.kernel.org, Javi Ferrer <javi.f.o@gmail.com>
Subject: Re: [PATCH] Input: mms114: don't report 0 pressure while still
 tracking contact(s)
Message-ID: <20200623182540.0ed5de81@primarylaptop.localdomain>
In-Reply-To: <20200614235735.GA11069@koala>
References: <20200606035017.7271-1-GNUtoo@cyberdimension.org>
        <20200606181806.GR89269@dtor-ws>
        <20200612194619.0ac97cf2@primarylaptop.localdomain>
        <20200614235735.GA11069@koala>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g1YUX0O4Nt5lL+pH2t9ktIQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--Sig_/g1YUX0O4Nt5lL+pH2t9ktIQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Jun 2020 09:57:35 +1000
Peter Hutterer <peter.hutterer@who-t.net> wrote:
> > > Event: time 1585880998.920994, type 3 (EV_ABS), code 57
> > > (ABS_MT_TRACKING_ID), value 0 Event: time 1585880998.920994, type
> > > 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 400 Event: time
> sorry, but this is completely unreadable. Please make sure it's in the
> originally formatting that evtest/evemu/libinput record spit out.
> Thanks.
Indeed.

I'm sorry about that, I didn't see it while sending the mail.

Here's the trace again:
-----------------------

Input driver version is 1.0.1
Input device ID: bus 0x18 vendor 0x0 product 0x0 version 0x0
Input device name: "MELFAS MMS114 Touchscreen"
Supported events:
  Event type 0 (EV_SYN)
  Event type 1 (EV_KEY)
    Event code 330 (BTN_TOUCH)
  Event type 3 (EV_ABS)
    Event code 0 (ABS_X)
      Value      0
      Min        0
      Max      719
    Event code 1 (ABS_Y)
      Value      0
      Min        0
      Max     1279
    Event code 24 (ABS_PRESSURE)
      Value      0
      Min        0
      Max      255
    Event code 47 (ABS_MT_SLOT)
      Value      0
      Min        0
      Max        9
    Event code 48 (ABS_MT_TOUCH_MAJOR)
      Value      0
      Min        0
      Max      255
    Event code 53 (ABS_MT_POSITION_X)
      Value      0
      Min        0
      Max      719
    Event code 54 (ABS_MT_POSITION_Y)
      Value      0
      Min        0
      Max     1279
    Event code 57 (ABS_MT_TRACKING_ID)
      Value      0
      Min        0
      Max    65535
    Event code 58 (ABS_MT_PRESSURE)
      Value      0
      Min        0
      Max      255
Properties:
  Property type 1 (INPUT_PROP_DIRECT)
Testing ... (interrupt to exit)
Event: time 1585880998.920994, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID=
), value 0
Event: time 1585880998.920994, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 400
Event: time 1585880998.920994, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1262
Event: time 1585880998.920994, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 6
Event: time 1585880998.920994, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 90
Event: time 1585880998.920994, type 1 (EV_KEY), code 330 (BTN_TOUCH), value=
 1
Event: time 1585880998.920994, type 3 (EV_ABS), code 0 (ABS_X), value 400
Event: time 1585880998.920994, type 3 (EV_ABS), code 1 (ABS_Y), value 1262
Event: time 1585880998.920994, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 90
Event: time 1585880998.920994, -------------- SYN_REPORT ------------
Event: time 1585880998.943145, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 403
Event: time 1585880998.943145, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 166
Event: time 1585880998.943145, type 3 (EV_ABS), code 0 (ABS_X), value 403
Event: time 1585880998.943145, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 166
Event: time 1585880998.943145, -------------- SYN_REPORT ------------
Event: time 1585880998.976952, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 404
Event: time 1585880998.976952, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 90
Event: time 1585880998.976952, type 3 (EV_ABS), code 0 (ABS_X), value 404
Event: time 1585880998.976952, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 90
Event: time 1585880998.976952, -------------- SYN_REPORT ------------
Event: time 1585880999.010796, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1261
Event: time 1585880999.010796, type 3 (EV_ABS), code 1 (ABS_Y), value 1261
Event: time 1585880999.010796, -------------- SYN_REPORT ------------
Event: time 1585880999.022117, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1260
Event: time 1585880999.022117, type 3 (EV_ABS), code 1 (ABS_Y), value 1260
Event: time 1585880999.022117, -------------- SYN_REPORT ------------
Event: time 1585880999.033536, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1259
Event: time 1585880999.033536, type 3 (EV_ABS), code 1 (ABS_Y), value 1259
Event: time 1585880999.033536, -------------- SYN_REPORT ------------
Event: time 1585880999.044851, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 405
Event: time 1585880999.044851, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1257
Event: time 1585880999.044851, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 166
Event: time 1585880999.044851, type 3 (EV_ABS), code 0 (ABS_X), value 405
Event: time 1585880999.044851, type 3 (EV_ABS), code 1 (ABS_Y), value 1257
Event: time 1585880999.044851, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 166
Event: time 1585880999.044851, -------------- SYN_REPORT ------------
Event: time 1585880999.056110, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1255
Event: time 1585880999.056110, type 3 (EV_ABS), code 1 (ABS_Y), value 1255
Event: time 1585880999.056110, -------------- SYN_REPORT ------------
Event: time 1585880999.067359, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 406
Event: time 1585880999.067359, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1251
Event: time 1585880999.067359, type 3 (EV_ABS), code 0 (ABS_X), value 406
Event: time 1585880999.067359, type 3 (EV_ABS), code 1 (ABS_Y), value 1251
Event: time 1585880999.067359, -------------- SYN_REPORT ------------
Event: time 1585880999.078736, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1248
Event: time 1585880999.078736, type 3 (EV_ABS), code 1 (ABS_Y), value 1248
Event: time 1585880999.078736, -------------- SYN_REPORT ------------
Event: time 1585880999.090247, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1247
Event: time 1585880999.090247, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 90
Event: time 1585880999.090247, type 3 (EV_ABS), code 1 (ABS_Y), value 1247
Event: time 1585880999.090247, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 90
Event: time 1585880999.090247, -------------- SYN_REPORT ------------
Event: time 1585880999.101531, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1245
Event: time 1585880999.101531, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 9
Event: time 1585880999.101531, type 3 (EV_ABS), code 1 (ABS_Y), value 1245
Event: time 1585880999.101531, -------------- SYN_REPORT ------------
Event: time 1585880999.112822, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1242
Event: time 1585880999.112822, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 10
Event: time 1585880999.112822, type 3 (EV_ABS), code 1 (ABS_Y), value 1242
Event: time 1585880999.112822, -------------- SYN_REPORT ------------
Event: time 1585880999.124001, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 407
Event: time 1585880999.124001, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1239
Event: time 1585880999.124001, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 166
Event: time 1585880999.124001, type 3 (EV_ABS), code 0 (ABS_X), value 407
Event: time 1585880999.124001, type 3 (EV_ABS), code 1 (ABS_Y), value 1239
Event: time 1585880999.124001, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 166
Event: time 1585880999.124001, -------------- SYN_REPORT ------------
Event: time 1585880999.135219, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 408
Event: time 1585880999.135219, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1237
Event: time 1585880999.135219, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 90
Event: time 1585880999.135219, type 3 (EV_ABS), code 0 (ABS_X), value 408
Event: time 1585880999.135219, type 3 (EV_ABS), code 1 (ABS_Y), value 1237
Event: time 1585880999.135219, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 90
Event: time 1585880999.135219, -------------- SYN_REPORT ------------
Event: time 1585880999.146534, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1235
Event: time 1585880999.146534, type 3 (EV_ABS), code 1 (ABS_Y), value 1235
Event: time 1585880999.146534, -------------- SYN_REPORT ------------
Event: time 1585880999.158050, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1232
Event: time 1585880999.158050, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 0
Event: time 1585880999.158050, type 3 (EV_ABS), code 1 (ABS_Y), value 1232
Event: time 1585880999.158050, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 0
Event: time 1585880999.158050, -------------- SYN_REPORT ------------
Event: time 1585880999.169354, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1229
Event: time 1585880999.169354, type 3 (EV_ABS), code 1 (ABS_Y), value 1229
Event: time 1585880999.169354, -------------- SYN_REPORT ------------
Event: time 1585880999.180602, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1226
Event: time 1585880999.180602, type 3 (EV_ABS), code 1 (ABS_Y), value 1226
Event: time 1585880999.180602, -------------- SYN_REPORT ------------
Event: time 1585880999.192019, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1223
Event: time 1585880999.192019, type 3 (EV_ABS), code 1 (ABS_Y), value 1223
Event: time 1585880999.192019, -------------- SYN_REPORT ------------
Event: time 1585880999.203274, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1220
Event: time 1585880999.203274, type 3 (EV_ABS), code 1 (ABS_Y), value 1220
Event: time 1585880999.203274, -------------- SYN_REPORT ------------
Event: time 1585880999.214621, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1218
Event: time 1585880999.214621, type 3 (EV_ABS), code 1 (ABS_Y), value 1218
Event: time 1585880999.214621, -------------- SYN_REPORT ------------
Event: time 1585880999.225895, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1215
Event: time 1585880999.225895, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585880999.225895, type 3 (EV_ABS), code 1 (ABS_Y), value 1215
Event: time 1585880999.225895, -------------- SYN_REPORT ------------
Event: time 1585880999.237214, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1213
Event: time 1585880999.237214, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585880999.237214, type 3 (EV_ABS), code 1 (ABS_Y), value 1213
Event: time 1585880999.237214, -------------- SYN_REPORT ------------
Event: time 1585880999.248531, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1210
Event: time 1585880999.248531, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 14
Event: time 1585880999.248531, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 244
Event: time 1585880999.248531, type 3 (EV_ABS), code 1 (ABS_Y), value 1210
Event: time 1585880999.248531, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 244
Event: time 1585880999.248531, -------------- SYN_REPORT ------------
Event: time 1585880999.259798, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1208
Event: time 1585880999.259798, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 0
Event: time 1585880999.259798, type 3 (EV_ABS), code 1 (ABS_Y), value 1208
Event: time 1585880999.259798, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 0
Event: time 1585880999.259798, -------------- SYN_REPORT ------------
Event: time 1585880999.271069, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1205
Event: time 1585880999.271069, type 3 (EV_ABS), code 1 (ABS_Y), value 1205
Event: time 1585880999.271069, -------------- SYN_REPORT ------------
Event: time 1585880999.282444, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1203
Event: time 1585880999.282444, type 3 (EV_ABS), code 1 (ABS_Y), value 1203
Event: time 1585880999.282444, -------------- SYN_REPORT ------------
Event: time 1585880999.293650, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1201
Event: time 1585880999.293650, type 3 (EV_ABS), code 1 (ABS_Y), value 1201
Event: time 1585880999.293650, -------------- SYN_REPORT ------------
Event: time 1585880999.304984, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1199
Event: time 1585880999.304984, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 13
Event: time 1585880999.304984, type 3 (EV_ABS), code 1 (ABS_Y), value 1199
Event: time 1585880999.304984, -------------- SYN_REPORT ------------
Event: time 1585880999.316383, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1195
Event: time 1585880999.316383, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585880999.316383, type 3 (EV_ABS), code 1 (ABS_Y), value 1195
Event: time 1585880999.316383, -------------- SYN_REPORT ------------
Event: time 1585880999.327652, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1190
Event: time 1585880999.327652, type 3 (EV_ABS), code 1 (ABS_Y), value 1190
Event: time 1585880999.327652, -------------- SYN_REPORT ------------
Event: time 1585880999.338820, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 409
Event: time 1585880999.338820, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1184
Event: time 1585880999.338820, type 3 (EV_ABS), code 0 (ABS_X), value 409
Event: time 1585880999.338820, type 3 (EV_ABS), code 1 (ABS_Y), value 1184
Event: time 1585880999.338820, -------------- SYN_REPORT ------------
Event: time 1585880999.350238, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1179
Event: time 1585880999.350238, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585880999.350238, type 3 (EV_ABS), code 1 (ABS_Y), value 1179
Event: time 1585880999.350238, -------------- SYN_REPORT ------------
Event: time 1585880999.361535, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1174
Event: time 1585880999.361535, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585880999.361535, type 3 (EV_ABS), code 1 (ABS_Y), value 1174
Event: time 1585880999.361535, -------------- SYN_REPORT ------------
Event: time 1585880999.372837, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1170
Event: time 1585880999.372837, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585880999.372837, type 3 (EV_ABS), code 1 (ABS_Y), value 1170
Event: time 1585880999.372837, -------------- SYN_REPORT ------------
Event: time 1585880999.384080, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1165
Event: time 1585880999.384080, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 10
Event: time 1585880999.384080, type 3 (EV_ABS), code 1 (ABS_Y), value 1165
Event: time 1585880999.384080, -------------- SYN_REPORT ------------
Event: time 1585880999.395397, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1160
Event: time 1585880999.395397, type 3 (EV_ABS), code 1 (ABS_Y), value 1160
Event: time 1585880999.395397, -------------- SYN_REPORT ------------
Event: time 1585880999.406691, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1155
Event: time 1585880999.406691, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585880999.406691, type 3 (EV_ABS), code 1 (ABS_Y), value 1155
Event: time 1585880999.406691, -------------- SYN_REPORT ------------
Event: time 1585880999.418074, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 410
Event: time 1585880999.418074, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1148
Event: time 1585880999.418074, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585880999.418074, type 3 (EV_ABS), code 0 (ABS_X), value 410
Event: time 1585880999.418074, type 3 (EV_ABS), code 1 (ABS_Y), value 1148
Event: time 1585880999.418074, -------------- SYN_REPORT ------------
Event: time 1585880999.429419, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1142
Event: time 1585880999.429419, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 13
Event: time 1585880999.429419, type 3 (EV_ABS), code 1 (ABS_Y), value 1142
Event: time 1585880999.429419, -------------- SYN_REPORT ------------
Event: time 1585880999.440541, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1136
Event: time 1585880999.440541, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585880999.440541, type 3 (EV_ABS), code 1 (ABS_Y), value 1136
Event: time 1585880999.440541, -------------- SYN_REPORT ------------
Event: time 1585880999.451973, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1130
Event: time 1585880999.451973, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 13
Event: time 1585880999.451973, type 3 (EV_ABS), code 1 (ABS_Y), value 1130
Event: time 1585880999.451973, -------------- SYN_REPORT ------------
Event: time 1585880999.463270, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1123
Event: time 1585880999.463270, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 14
Event: time 1585880999.463270, type 3 (EV_ABS), code 1 (ABS_Y), value 1123
Event: time 1585880999.463270, -------------- SYN_REPORT ------------
Event: time 1585880999.474516, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1119
Event: time 1585880999.474516, type 3 (EV_ABS), code 1 (ABS_Y), value 1119
Event: time 1585880999.474516, -------------- SYN_REPORT ------------
Event: time 1585880999.485865, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1114
Event: time 1585880999.485865, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585880999.485865, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 12
Event: time 1585880999.485865, type 3 (EV_ABS), code 1 (ABS_Y), value 1114
Event: time 1585880999.485865, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 12
Event: time 1585880999.485865, -------------- SYN_REPORT ------------
Event: time 1585880999.497151, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1109
Event: time 1585880999.497151, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 0
Event: time 1585880999.497151, type 3 (EV_ABS), code 1 (ABS_Y), value 1109
Event: time 1585880999.497151, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 0
Event: time 1585880999.497151, -------------- SYN_REPORT ------------
Event: time 1585880999.508346, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1104
Event: time 1585880999.508346, type 3 (EV_ABS), code 1 (ABS_Y), value 1104
Event: time 1585880999.508346, -------------- SYN_REPORT ------------
Event: time 1585880999.519888, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1099
Event: time 1585880999.519888, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585880999.519888, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 3
Event: time 1585880999.519888, type 3 (EV_ABS), code 1 (ABS_Y), value 1099
Event: time 1585880999.519888, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 3
Event: time 1585880999.519888, -------------- SYN_REPORT ------------
Event: time 1585880999.531159, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 411
Event: time 1585880999.531159, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1091
Event: time 1585880999.531159, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585880999.531159, type 3 (EV_ABS), code 0 (ABS_X), value 411
Event: time 1585880999.531159, type 3 (EV_ABS), code 1 (ABS_Y), value 1091
Event: time 1585880999.531159, -------------- SYN_REPORT ------------
Event: time 1585880999.542269, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1084
Event: time 1585880999.542269, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 13
Event: time 1585880999.542269, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 0
Event: time 1585880999.542269, type 3 (EV_ABS), code 1 (ABS_Y), value 1084
Event: time 1585880999.542269, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 0
Event: time 1585880999.542269, -------------- SYN_REPORT ------------
Event: time 1585880999.553544, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1077
Event: time 1585880999.553544, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585880999.553544, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 11
Event: time 1585880999.553544, type 3 (EV_ABS), code 1 (ABS_Y), value 1077
Event: time 1585880999.553544, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 11
Event: time 1585880999.553544, -------------- SYN_REPORT ------------
Event: time 1585880999.564856, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1071
Event: time 1585880999.564856, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585880999.564856, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 0
Event: time 1585880999.564856, type 3 (EV_ABS), code 1 (ABS_Y), value 1071
Event: time 1585880999.564856, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 0
Event: time 1585880999.564856, -------------- SYN_REPORT ------------
Event: time 1585880999.576153, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1067
Event: time 1585880999.576153, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 13
Event: time 1585880999.576153, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 12
Event: time 1585880999.576153, type 3 (EV_ABS), code 1 (ABS_Y), value 1067
Event: time 1585880999.576153, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 12
Event: time 1585880999.576153, -------------- SYN_REPORT ------------
Event: time 1585880999.587435, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1061
Event: time 1585880999.587435, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585880999.587435, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 0
Event: time 1585880999.587435, type 3 (EV_ABS), code 1 (ABS_Y), value 1061
Event: time 1585880999.587435, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 0
Event: time 1585880999.587435, -------------- SYN_REPORT ------------
Event: time 1585880999.598693, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1055
Event: time 1585880999.598693, type 3 (EV_ABS), code 1 (ABS_Y), value 1055
Event: time 1585880999.598693, -------------- SYN_REPORT ------------
Event: time 1585880999.610050, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1048
Event: time 1585880999.610050, type 3 (EV_ABS), code 1 (ABS_Y), value 1048
Event: time 1585880999.610050, -------------- SYN_REPORT ------------
Event: time 1585880999.621421, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1040
Event: time 1585880999.621421, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 13
Event: time 1585880999.621421, type 3 (EV_ABS), code 1 (ABS_Y), value 1040
Event: time 1585880999.621421, -------------- SYN_REPORT ------------
Event: time 1585880999.632547, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1032
Event: time 1585880999.632547, type 3 (EV_ABS), code 1 (ABS_Y), value 1032
Event: time 1585880999.632547, -------------- SYN_REPORT ------------
Event: time 1585880999.643872, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1025
Event: time 1585880999.643872, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 14
Event: time 1585880999.643872, type 3 (EV_ABS), code 1 (ABS_Y), value 1025
Event: time 1585880999.643872, -------------- SYN_REPORT ------------
Event: time 1585880999.655241, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 410
Event: time 1585880999.655241, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1019
Event: time 1585880999.655241, type 3 (EV_ABS), code 0 (ABS_X), value 410
Event: time 1585880999.655241, type 3 (EV_ABS), code 1 (ABS_Y), value 1019
Event: time 1585880999.655241, -------------- SYN_REPORT ------------
Event: time 1585880999.666550, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1012
Event: time 1585880999.666550, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 13
Event: time 1585880999.666550, type 3 (EV_ABS), code 1 (ABS_Y), value 1012
Event: time 1585880999.666550, -------------- SYN_REPORT ------------
Event: time 1585880999.677914, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 411
Event: time 1585880999.677914, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 1004
Event: time 1585880999.677914, type 3 (EV_ABS), code 0 (ABS_X), value 411
Event: time 1585880999.677914, type 3 (EV_ABS), code 1 (ABS_Y), value 1004
Event: time 1585880999.677914, -------------- SYN_REPORT ------------
Event: time 1585880999.689170, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 410
Event: time 1585880999.689170, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 996
Event: time 1585880999.689170, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585880999.689170, type 3 (EV_ABS), code 0 (ABS_X), value 410
Event: time 1585880999.689170, type 3 (EV_ABS), code 1 (ABS_Y), value 996
Event: time 1585880999.689170, -------------- SYN_REPORT ------------
Event: time 1585880999.700427, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 986
Event: time 1585880999.700427, type 3 (EV_ABS), code 1 (ABS_Y), value 986
Event: time 1585880999.700427, -------------- SYN_REPORT ------------
Event: time 1585880999.711707, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 978
Event: time 1585880999.711707, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 13
Event: time 1585880999.711707, type 3 (EV_ABS), code 1 (ABS_Y), value 978
Event: time 1585880999.711707, -------------- SYN_REPORT ------------
Event: time 1585880999.722953, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 971
Event: time 1585880999.722953, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 15
Event: time 1585880999.722953, type 3 (EV_ABS), code 1 (ABS_Y), value 971
Event: time 1585880999.722953, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 15
Event: time 1585880999.722953, -------------- SYN_REPORT ------------
Event: time 1585880999.734383, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 411
Event: time 1585880999.734383, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 964
Event: time 1585880999.734383, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 11
Event: time 1585880999.734383, type 3 (EV_ABS), code 0 (ABS_X), value 411
Event: time 1585880999.734383, type 3 (EV_ABS), code 1 (ABS_Y), value 964
Event: time 1585880999.734383, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 11
Event: time 1585880999.734383, -------------- SYN_REPORT ------------
Event: time 1585880999.745726, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 956
Event: time 1585880999.745726, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585880999.745726, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 3
Event: time 1585880999.745726, type 3 (EV_ABS), code 1 (ABS_Y), value 956
Event: time 1585880999.745726, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 3
Event: time 1585880999.745726, -------------- SYN_REPORT ------------
Event: time 1585880999.756961, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 412
Event: time 1585880999.756961, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 945
Event: time 1585880999.756961, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 0
Event: time 1585880999.756961, type 3 (EV_ABS), code 0 (ABS_X), value 412
Event: time 1585880999.756961, type 3 (EV_ABS), code 1 (ABS_Y), value 945
Event: time 1585880999.756961, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 0
Event: time 1585880999.756961, -------------- SYN_REPORT ------------
Event: time 1585880999.768231, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 934
Event: time 1585880999.768231, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585880999.768231, type 3 (EV_ABS), code 1 (ABS_Y), value 934
Event: time 1585880999.768231, -------------- SYN_REPORT ------------
Event: time 1585880999.779481, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 925
Event: time 1585880999.779481, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 14
Event: time 1585880999.779481, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 15
Event: time 1585880999.779481, type 3 (EV_ABS), code 1 (ABS_Y), value 925
Event: time 1585880999.779481, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 15
Event: time 1585880999.779481, -------------- SYN_REPORT ------------
Event: time 1585880999.790830, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 917
Event: time 1585880999.790830, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 11
Event: time 1585880999.790830, type 3 (EV_ABS), code 1 (ABS_Y), value 917
Event: time 1585880999.790830, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 11
Event: time 1585880999.790830, -------------- SYN_REPORT ------------
Event: time 1585880999.802065, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 912
Event: time 1585880999.802065, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585880999.802065, type 3 (EV_ABS), code 1 (ABS_Y), value 912
Event: time 1585880999.802065, -------------- SYN_REPORT ------------
Event: time 1585880999.813323, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 411
Event: time 1585880999.813323, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 899
Event: time 1585880999.813323, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 3
Event: time 1585880999.813323, type 3 (EV_ABS), code 0 (ABS_X), value 411
Event: time 1585880999.813323, type 3 (EV_ABS), code 1 (ABS_Y), value 899
Event: time 1585880999.813323, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 3
Event: time 1585880999.813323, -------------- SYN_REPORT ------------
Event: time 1585880999.824774, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 889
Event: time 1585880999.824774, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 11
Event: time 1585880999.824774, type 3 (EV_ABS), code 1 (ABS_Y), value 889
Event: time 1585880999.824774, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 11
Event: time 1585880999.824774, -------------- SYN_REPORT ------------
Event: time 1585880999.835927, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 882
Event: time 1585880999.835927, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 12
Event: time 1585880999.835927, type 3 (EV_ABS), code 1 (ABS_Y), value 882
Event: time 1585880999.835927, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 12
Event: time 1585880999.835927, -------------- SYN_REPORT ------------
Event: time 1585880999.847216, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 875
Event: time 1585880999.847216, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 0
Event: time 1585880999.847216, type 3 (EV_ABS), code 1 (ABS_Y), value 875
Event: time 1585880999.847216, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 0
Event: time 1585880999.847216, -------------- SYN_REPORT ------------
Event: time 1585880999.858488, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 870
Event: time 1585880999.858488, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 13
Event: time 1585880999.858488, type 3 (EV_ABS), code 1 (ABS_Y), value 870
Event: time 1585880999.858488, -------------- SYN_REPORT ------------
Event: time 1585880999.869771, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 865
Event: time 1585880999.869771, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585880999.869771, type 3 (EV_ABS), code 1 (ABS_Y), value 865
Event: time 1585880999.869771, -------------- SYN_REPORT ------------
Event: time 1585880999.881020, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 410
Event: time 1585880999.881020, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 860
Event: time 1585880999.881020, type 3 (EV_ABS), code 0 (ABS_X), value 410
Event: time 1585880999.881020, type 3 (EV_ABS), code 1 (ABS_Y), value 860
Event: time 1585880999.881020, -------------- SYN_REPORT ------------
Event: time 1585880999.892410, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 855
Event: time 1585880999.892410, type 3 (EV_ABS), code 1 (ABS_Y), value 855
Event: time 1585880999.892410, -------------- SYN_REPORT ------------
Event: time 1585880999.903636, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 849
Event: time 1585880999.903636, type 3 (EV_ABS), code 1 (ABS_Y), value 849
Event: time 1585880999.903636, -------------- SYN_REPORT ------------
Event: time 1585880999.914828, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 841
Event: time 1585880999.914828, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585880999.914828, type 3 (EV_ABS), code 1 (ABS_Y), value 841
Event: time 1585880999.914828, -------------- SYN_REPORT ------------
Event: time 1585880999.926271, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 835
Event: time 1585880999.926271, type 3 (EV_ABS), code 1 (ABS_Y), value 835
Event: time 1585880999.926271, -------------- SYN_REPORT ------------
Event: time 1585880999.937540, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 830
Event: time 1585880999.937540, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585880999.937540, type 3 (EV_ABS), code 1 (ABS_Y), value 830
Event: time 1585880999.937540, -------------- SYN_REPORT ------------
Event: time 1585880999.948811, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 825
Event: time 1585880999.948811, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 13
Event: time 1585880999.948811, type 3 (EV_ABS), code 1 (ABS_Y), value 825
Event: time 1585880999.948811, -------------- SYN_REPORT ------------
Event: time 1585880999.960194, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 411
Event: time 1585880999.960194, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 819
Event: time 1585880999.960194, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 12
Event: time 1585880999.960194, type 3 (EV_ABS), code 0 (ABS_X), value 411
Event: time 1585880999.960194, type 3 (EV_ABS), code 1 (ABS_Y), value 819
Event: time 1585880999.960194, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 12
Event: time 1585880999.960194, -------------- SYN_REPORT ------------
Event: time 1585880999.971408, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 814
Event: time 1585880999.971408, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585880999.971408, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 11
Event: time 1585880999.971408, type 3 (EV_ABS), code 1 (ABS_Y), value 814
Event: time 1585880999.971408, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 11
Event: time 1585880999.971408, -------------- SYN_REPORT ------------
Event: time 1585880999.982691, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 807
Event: time 1585880999.982691, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585880999.982691, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 0
Event: time 1585880999.982691, type 3 (EV_ABS), code 1 (ABS_Y), value 807
Event: time 1585880999.982691, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 0
Event: time 1585880999.982691, -------------- SYN_REPORT ------------
Event: time 1585880999.993986, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 412
Event: time 1585880999.993986, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 800
Event: time 1585880999.993986, type 3 (EV_ABS), code 0 (ABS_X), value 412
Event: time 1585880999.993986, type 3 (EV_ABS), code 1 (ABS_Y), value 800
Event: time 1585880999.993986, -------------- SYN_REPORT ------------
Event: time 1585881000.005298, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 413
Event: time 1585881000.005298, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 791
Event: time 1585881000.005298, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585881000.005298, type 3 (EV_ABS), code 0 (ABS_X), value 413
Event: time 1585881000.005298, type 3 (EV_ABS), code 1 (ABS_Y), value 791
Event: time 1585881000.005298, -------------- SYN_REPORT ------------
Event: time 1585881000.016629, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 784
Event: time 1585881000.016629, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585881000.016629, type 3 (EV_ABS), code 1 (ABS_Y), value 784
Event: time 1585881000.016629, -------------- SYN_REPORT ------------
Event: time 1585881000.027817, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 777
Event: time 1585881000.027817, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585881000.027817, type 3 (EV_ABS), code 1 (ABS_Y), value 777
Event: time 1585881000.027817, -------------- SYN_REPORT ------------
Event: time 1585881000.039184, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 771
Event: time 1585881000.039184, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 13
Event: time 1585881000.039184, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 15
Event: time 1585881000.039184, type 3 (EV_ABS), code 1 (ABS_Y), value 771
Event: time 1585881000.039184, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 15
Event: time 1585881000.039184, -------------- SYN_REPORT ------------
Event: time 1585881000.050393, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 764
Event: time 1585881000.050393, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 10
Event: time 1585881000.050393, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 11
Event: time 1585881000.050393, type 3 (EV_ABS), code 1 (ABS_Y), value 764
Event: time 1585881000.050393, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 11
Event: time 1585881000.050393, -------------- SYN_REPORT ------------
Event: time 1585881000.061733, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 414
Event: time 1585881000.061733, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 757
Event: time 1585881000.061733, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585881000.061733, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 0
Event: time 1585881000.061733, type 3 (EV_ABS), code 0 (ABS_X), value 414
Event: time 1585881000.061733, type 3 (EV_ABS), code 1 (ABS_Y), value 757
Event: time 1585881000.061733, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 0
Event: time 1585881000.061733, -------------- SYN_REPORT ------------
Event: time 1585881000.072946, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 746
Event: time 1585881000.072946, type 3 (EV_ABS), code 1 (ABS_Y), value 746
Event: time 1585881000.072946, -------------- SYN_REPORT ------------
Event: time 1585881000.084327, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 736
Event: time 1585881000.084327, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 244
Event: time 1585881000.084327, type 3 (EV_ABS), code 1 (ABS_Y), value 736
Event: time 1585881000.084327, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 244
Event: time 1585881000.084327, -------------- SYN_REPORT ------------
Event: time 1585881000.095591, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 727
Event: time 1585881000.095591, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 13
Event: time 1585881000.095591, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 22
Event: time 1585881000.095591, type 3 (EV_ABS), code 1 (ABS_Y), value 727
Event: time 1585881000.095591, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 22
Event: time 1585881000.095591, -------------- SYN_REPORT ------------
Event: time 1585881000.107011, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 717
Event: time 1585881000.107011, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585881000.107011, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 0
Event: time 1585881000.107011, type 3 (EV_ABS), code 1 (ABS_Y), value 717
Event: time 1585881000.107011, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 0
Event: time 1585881000.107011, -------------- SYN_REPORT ------------
Event: time 1585881000.118340, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 704
Event: time 1585881000.118340, type 3 (EV_ABS), code 1 (ABS_Y), value 704
Event: time 1585881000.118340, -------------- SYN_REPORT ------------
Event: time 1585881000.129655, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 415
Event: time 1585881000.129655, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 690
Event: time 1585881000.129655, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585881000.129655, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 245
Event: time 1585881000.129655, type 3 (EV_ABS), code 0 (ABS_X), value 415
Event: time 1585881000.129655, type 3 (EV_ABS), code 1 (ABS_Y), value 690
Event: time 1585881000.129655, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 245
Event: time 1585881000.129655, -------------- SYN_REPORT ------------
Event: time 1585881000.140973, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 416
Event: time 1585881000.140973, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 680
Event: time 1585881000.140973, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 234
Event: time 1585881000.140973, type 3 (EV_ABS), code 0 (ABS_X), value 416
Event: time 1585881000.140973, type 3 (EV_ABS), code 1 (ABS_Y), value 680
Event: time 1585881000.140973, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 234
Event: time 1585881000.140973, -------------- SYN_REPORT ------------
Event: time 1585881000.152227, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 673
Event: time 1585881000.152227, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 11
Event: time 1585881000.152227, type 3 (EV_ABS), code 1 (ABS_Y), value 673
Event: time 1585881000.152227, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 11
Event: time 1585881000.152227, -------------- SYN_REPORT ------------
Event: time 1585881000.163529, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 666
Event: time 1585881000.163529, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 0
Event: time 1585881000.163529, type 3 (EV_ABS), code 1 (ABS_Y), value 666
Event: time 1585881000.163529, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 0
Event: time 1585881000.163529, -------------- SYN_REPORT ------------
Event: time 1585881000.174702, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 659
Event: time 1585881000.174702, type 3 (EV_ABS), code 1 (ABS_Y), value 659
Event: time 1585881000.174702, -------------- SYN_REPORT ------------
Event: time 1585881000.186024, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 650
Event: time 1585881000.186024, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585881000.186024, type 3 (EV_ABS), code 1 (ABS_Y), value 650
Event: time 1585881000.186024, -------------- SYN_REPORT ------------
Event: time 1585881000.197296, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 640
Event: time 1585881000.197296, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 245
Event: time 1585881000.197296, type 3 (EV_ABS), code 1 (ABS_Y), value 640
Event: time 1585881000.197296, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 245
Event: time 1585881000.197296, -------------- SYN_REPORT ------------
Event: time 1585881000.208603, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 631
Event: time 1585881000.208603, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 13
Event: time 1585881000.208603, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 244
Event: time 1585881000.208603, type 3 (EV_ABS), code 1 (ABS_Y), value 631
Event: time 1585881000.208603, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 244
Event: time 1585881000.208603, -------------- SYN_REPORT ------------
Event: time 1585881000.219898, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 623
Event: time 1585881000.219898, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 11
Event: time 1585881000.219898, type 3 (EV_ABS), code 1 (ABS_Y), value 623
Event: time 1585881000.219898, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 11
Event: time 1585881000.219898, -------------- SYN_REPORT ------------
Event: time 1585881000.231202, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 417
Event: time 1585881000.231202, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 615
Event: time 1585881000.231202, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585881000.231202, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 9
Event: time 1585881000.231202, type 3 (EV_ABS), code 0 (ABS_X), value 417
Event: time 1585881000.231202, type 3 (EV_ABS), code 1 (ABS_Y), value 615
Event: time 1585881000.231202, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 9
Event: time 1585881000.231202, -------------- SYN_REPORT ------------
Event: time 1585881000.242723, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 419
Event: time 1585881000.242723, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 604
Event: time 1585881000.242723, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 0
Event: time 1585881000.242723, type 3 (EV_ABS), code 0 (ABS_X), value 419
Event: time 1585881000.242723, type 3 (EV_ABS), code 1 (ABS_Y), value 604
Event: time 1585881000.242723, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 0
Event: time 1585881000.242723, -------------- SYN_REPORT ------------
Event: time 1585881000.253968, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 420
Event: time 1585881000.253968, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 594
Event: time 1585881000.253968, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 36
Event: time 1585881000.253968, type 3 (EV_ABS), code 0 (ABS_X), value 420
Event: time 1585881000.253968, type 3 (EV_ABS), code 1 (ABS_Y), value 594
Event: time 1585881000.253968, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 36
Event: time 1585881000.253968, -------------- SYN_REPORT ------------
Event: time 1585881000.265203, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 585
Event: time 1585881000.265203, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 10
Event: time 1585881000.265203, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 247
Event: time 1585881000.265203, type 3 (EV_ABS), code 1 (ABS_Y), value 585
Event: time 1585881000.265203, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 247
Event: time 1585881000.265203, -------------- SYN_REPORT ------------
Event: time 1585881000.276684, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 421
Event: time 1585881000.276684, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 578
Event: time 1585881000.276684, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585881000.276684, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 60
Event: time 1585881000.276684, type 3 (EV_ABS), code 0 (ABS_X), value 421
Event: time 1585881000.276684, type 3 (EV_ABS), code 1 (ABS_Y), value 578
Event: time 1585881000.276684, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 60
Event: time 1585881000.276684, -------------- SYN_REPORT ------------
Event: time 1585881000.287969, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 422
Event: time 1585881000.287969, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 572
Event: time 1585881000.287969, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 0
Event: time 1585881000.287969, type 3 (EV_ABS), code 0 (ABS_X), value 422
Event: time 1585881000.287969, type 3 (EV_ABS), code 1 (ABS_Y), value 572
Event: time 1585881000.287969, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 0
Event: time 1585881000.287969, -------------- SYN_REPORT ------------
Event: time 1585881000.298931, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 423
Event: time 1585881000.298931, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 566
Event: time 1585881000.298931, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 15
Event: time 1585881000.298931, type 3 (EV_ABS), code 0 (ABS_X), value 423
Event: time 1585881000.298931, type 3 (EV_ABS), code 1 (ABS_Y), value 566
Event: time 1585881000.298931, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 15
Event: time 1585881000.298931, -------------- SYN_REPORT ------------
Event: time 1585881000.310589, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 425
Event: time 1585881000.310589, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 557
Event: time 1585881000.310589, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 10
Event: time 1585881000.310589, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 4
Event: time 1585881000.310589, type 3 (EV_ABS), code 0 (ABS_X), value 425
Event: time 1585881000.310589, type 3 (EV_ABS), code 1 (ABS_Y), value 557
Event: time 1585881000.310589, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 4
Event: time 1585881000.310589, -------------- SYN_REPORT ------------
Event: time 1585881000.321706, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 426
Event: time 1585881000.321706, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 548
Event: time 1585881000.321706, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585881000.321706, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 22
Event: time 1585881000.321706, type 3 (EV_ABS), code 0 (ABS_X), value 426
Event: time 1585881000.321706, type 3 (EV_ABS), code 1 (ABS_Y), value 548
Event: time 1585881000.321706, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 22
Event: time 1585881000.321706, -------------- SYN_REPORT ------------
Event: time 1585881000.333072, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 427
Event: time 1585881000.333072, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 541
Event: time 1585881000.333072, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 25
Event: time 1585881000.333072, type 3 (EV_ABS), code 0 (ABS_X), value 427
Event: time 1585881000.333072, type 3 (EV_ABS), code 1 (ABS_Y), value 541
Event: time 1585881000.333072, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 25
Event: time 1585881000.333072, -------------- SYN_REPORT ------------
Event: time 1585881000.344436, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 428
Event: time 1585881000.344436, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 534
Event: time 1585881000.344436, type 3 (EV_ABS), code 0 (ABS_X), value 428
Event: time 1585881000.344436, type 3 (EV_ABS), code 1 (ABS_Y), value 534
Event: time 1585881000.344436, -------------- SYN_REPORT ------------
Event: time 1585881000.355575, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 429
Event: time 1585881000.355575, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 528
Event: time 1585881000.355575, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 45
Event: time 1585881000.355575, type 3 (EV_ABS), code 0 (ABS_X), value 429
Event: time 1585881000.355575, type 3 (EV_ABS), code 1 (ABS_Y), value 528
Event: time 1585881000.355575, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 45
Event: time 1585881000.355575, -------------- SYN_REPORT ------------
Event: time 1585881000.367008, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 430
Event: time 1585881000.367008, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 520
Event: time 1585881000.367008, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 10
Event: time 1585881000.367008, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 0
Event: time 1585881000.367008, type 3 (EV_ABS), code 0 (ABS_X), value 430
Event: time 1585881000.367008, type 3 (EV_ABS), code 1 (ABS_Y), value 520
Event: time 1585881000.367008, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 0
Event: time 1585881000.367008, -------------- SYN_REPORT ------------
Event: time 1585881000.378556, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 431
Event: time 1585881000.378556, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 510
Event: time 1585881000.378556, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585881000.378556, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 3
Event: time 1585881000.378556, type 3 (EV_ABS), code 0 (ABS_X), value 431
Event: time 1585881000.378556, type 3 (EV_ABS), code 1 (ABS_Y), value 510
Event: time 1585881000.378556, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 3
Event: time 1585881000.378556, -------------- SYN_REPORT ------------
Event: time 1585881000.389827, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 503
Event: time 1585881000.389827, type 3 (EV_ABS), code 1 (ABS_Y), value 503
Event: time 1585881000.389827, -------------- SYN_REPORT ------------
Event: time 1585881000.400906, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 494
Event: time 1585881000.400906, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585881000.400906, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 12
Event: time 1585881000.400906, type 3 (EV_ABS), code 1 (ABS_Y), value 494
Event: time 1585881000.400906, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 12
Event: time 1585881000.400906, -------------- SYN_REPORT ------------
Event: time 1585881000.412237, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 487
Event: time 1585881000.412237, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585881000.412237, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 25
Event: time 1585881000.412237, type 3 (EV_ABS), code 1 (ABS_Y), value 487
Event: time 1585881000.412237, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 25
Event: time 1585881000.412237, -------------- SYN_REPORT ------------
Event: time 1585881000.423543, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 433
Event: time 1585881000.423543, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 477
Event: time 1585881000.423543, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585881000.423543, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 20
Event: time 1585881000.423543, type 3 (EV_ABS), code 0 (ABS_X), value 433
Event: time 1585881000.423543, type 3 (EV_ABS), code 1 (ABS_Y), value 477
Event: time 1585881000.423543, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 20
Event: time 1585881000.423543, -------------- SYN_REPORT ------------
Event: time 1585881000.434674, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 435
Event: time 1585881000.434674, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 468
Event: time 1585881000.434674, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 18
Event: time 1585881000.434674, type 3 (EV_ABS), code 0 (ABS_X), value 435
Event: time 1585881000.434674, type 3 (EV_ABS), code 1 (ABS_Y), value 468
Event: time 1585881000.434674, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 18
Event: time 1585881000.434674, -------------- SYN_REPORT ------------
Event: time 1585881000.446104, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 437
Event: time 1585881000.446104, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 457
Event: time 1585881000.446104, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 9
Event: time 1585881000.446104, type 3 (EV_ABS), code 0 (ABS_X), value 437
Event: time 1585881000.446104, type 3 (EV_ABS), code 1 (ABS_Y), value 457
Event: time 1585881000.446104, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 9
Event: time 1585881000.446104, -------------- SYN_REPORT ------------
Event: time 1585881000.457257, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 439
Event: time 1585881000.457257, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 447
Event: time 1585881000.457257, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 9
Event: time 1585881000.457257, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 0
Event: time 1585881000.457257, type 3 (EV_ABS), code 0 (ABS_X), value 439
Event: time 1585881000.457257, type 3 (EV_ABS), code 1 (ABS_Y), value 447
Event: time 1585881000.457257, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 0
Event: time 1585881000.457257, -------------- SYN_REPORT ------------
Event: time 1585881000.468640, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 441
Event: time 1585881000.468640, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 438
Event: time 1585881000.468640, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585881000.468640, type 3 (EV_ABS), code 0 (ABS_X), value 441
Event: time 1585881000.468640, type 3 (EV_ABS), code 1 (ABS_Y), value 438
Event: time 1585881000.468640, -------------- SYN_REPORT ------------
Event: time 1585881000.479768, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 442
Event: time 1585881000.479768, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 429
Event: time 1585881000.479768, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 32
Event: time 1585881000.479768, type 3 (EV_ABS), code 0 (ABS_X), value 442
Event: time 1585881000.479768, type 3 (EV_ABS), code 1 (ABS_Y), value 429
Event: time 1585881000.479768, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 32
Event: time 1585881000.479768, -------------- SYN_REPORT ------------
Event: time 1585881000.491154, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 422
Event: time 1585881000.491154, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585881000.491154, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 22
Event: time 1585881000.491154, type 3 (EV_ABS), code 1 (ABS_Y), value 422
Event: time 1585881000.491154, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 22
Event: time 1585881000.491154, -------------- SYN_REPORT ------------
Event: time 1585881000.502406, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 443
Event: time 1585881000.502406, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 414
Event: time 1585881000.502406, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585881000.502406, type 3 (EV_ABS), code 0 (ABS_X), value 443
Event: time 1585881000.502406, type 3 (EV_ABS), code 1 (ABS_Y), value 414
Event: time 1585881000.502406, -------------- SYN_REPORT ------------
Event: time 1585881000.513635, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 445
Event: time 1585881000.513635, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 401
Event: time 1585881000.513635, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 10
Event: time 1585881000.513635, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 12
Event: time 1585881000.513635, type 3 (EV_ABS), code 0 (ABS_X), value 445
Event: time 1585881000.513635, type 3 (EV_ABS), code 1 (ABS_Y), value 401
Event: time 1585881000.513635, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 12
Event: time 1585881000.513635, -------------- SYN_REPORT ------------
Event: time 1585881000.524986, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 447
Event: time 1585881000.524986, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 390
Event: time 1585881000.524986, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 17
Event: time 1585881000.524986, type 3 (EV_ABS), code 0 (ABS_X), value 447
Event: time 1585881000.524986, type 3 (EV_ABS), code 1 (ABS_Y), value 390
Event: time 1585881000.524986, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 17
Event: time 1585881000.524986, -------------- SYN_REPORT ------------
Event: time 1585881000.536235, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 448
Event: time 1585881000.536235, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 382
Event: time 1585881000.536235, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585881000.536235, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 246
Event: time 1585881000.536235, type 3 (EV_ABS), code 0 (ABS_X), value 448
Event: time 1585881000.536235, type 3 (EV_ABS), code 1 (ABS_Y), value 382
Event: time 1585881000.536235, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 246
Event: time 1585881000.536235, -------------- SYN_REPORT ------------
Event: time 1585881000.547519, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 449
Event: time 1585881000.547519, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 373
Event: time 1585881000.547519, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 0
Event: time 1585881000.547519, type 3 (EV_ABS), code 0 (ABS_X), value 449
Event: time 1585881000.547519, type 3 (EV_ABS), code 1 (ABS_Y), value 373
Event: time 1585881000.547519, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 0
Event: time 1585881000.547519, -------------- SYN_REPORT ------------
Event: time 1585881000.558891, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 450
Event: time 1585881000.558891, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 363
Event: time 1585881000.558891, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 10
Event: time 1585881000.558891, type 3 (EV_ABS), code 0 (ABS_X), value 450
Event: time 1585881000.558891, type 3 (EV_ABS), code 1 (ABS_Y), value 363
Event: time 1585881000.558891, -------------- SYN_REPORT ------------
Event: time 1585881000.570063, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 452
Event: time 1585881000.570063, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 349
Event: time 1585881000.570063, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 9
Event: time 1585881000.570063, type 3 (EV_ABS), code 0 (ABS_X), value 452
Event: time 1585881000.570063, type 3 (EV_ABS), code 1 (ABS_Y), value 349
Event: time 1585881000.570063, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 9
Event: time 1585881000.570063, -------------- SYN_REPORT ------------
Event: time 1585881000.581359, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 454
Event: time 1585881000.581359, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 339
Event: time 1585881000.581359, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 13
Event: time 1585881000.581359, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 11
Event: time 1585881000.581359, type 3 (EV_ABS), code 0 (ABS_X), value 454
Event: time 1585881000.581359, type 3 (EV_ABS), code 1 (ABS_Y), value 339
Event: time 1585881000.581359, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 11
Event: time 1585881000.581359, -------------- SYN_REPORT ------------
Event: time 1585881000.592623, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 455
Event: time 1585881000.592623, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 331
Event: time 1585881000.592623, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 10
Event: time 1585881000.592623, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 0
Event: time 1585881000.592623, type 3 (EV_ABS), code 0 (ABS_X), value 455
Event: time 1585881000.592623, type 3 (EV_ABS), code 1 (ABS_Y), value 331
Event: time 1585881000.592623, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 0
Event: time 1585881000.592623, -------------- SYN_REPORT ------------
Event: time 1585881000.603913, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 456
Event: time 1585881000.603913, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 323
Event: time 1585881000.603913, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585881000.603913, type 3 (EV_ABS), code 0 (ABS_X), value 456
Event: time 1585881000.603913, type 3 (EV_ABS), code 1 (ABS_Y), value 323
Event: time 1585881000.603913, -------------- SYN_REPORT ------------
Event: time 1585881000.615060, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 314
Event: time 1585881000.615060, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 10
Event: time 1585881000.615060, type 3 (EV_ABS), code 1 (ABS_Y), value 314
Event: time 1585881000.615060, -------------- SYN_REPORT ------------
Event: time 1585881000.626468, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 458
Event: time 1585881000.626468, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 299
Event: time 1585881000.626468, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585881000.626468, type 3 (EV_ABS), code 0 (ABS_X), value 458
Event: time 1585881000.626468, type 3 (EV_ABS), code 1 (ABS_Y), value 299
Event: time 1585881000.626468, -------------- SYN_REPORT ------------
Event: time 1585881000.637744, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 460
Event: time 1585881000.637744, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 287
Event: time 1585881000.637744, type 3 (EV_ABS), code 0 (ABS_X), value 460
Event: time 1585881000.637744, type 3 (EV_ABS), code 1 (ABS_Y), value 287
Event: time 1585881000.637744, -------------- SYN_REPORT ------------
Event: time 1585881000.649099, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 461
Event: time 1585881000.649099, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 278
Event: time 1585881000.649099, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585881000.649099, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 12
Event: time 1585881000.649099, type 3 (EV_ABS), code 0 (ABS_X), value 461
Event: time 1585881000.649099, type 3 (EV_ABS), code 1 (ABS_Y), value 278
Event: time 1585881000.649099, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 12
Event: time 1585881000.649099, -------------- SYN_REPORT ------------
Event: time 1585881000.660256, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 270
Event: time 1585881000.660256, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585881000.660256, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 16
Event: time 1585881000.660256, type 3 (EV_ABS), code 1 (ABS_Y), value 270
Event: time 1585881000.660256, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 16
Event: time 1585881000.660256, -------------- SYN_REPORT ------------
Event: time 1585881000.671942, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 258
Event: time 1585881000.671942, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585881000.671942, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 3
Event: time 1585881000.671942, type 3 (EV_ABS), code 1 (ABS_Y), value 258
Event: time 1585881000.671942, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 3
Event: time 1585881000.671942, -------------- SYN_REPORT ------------
Event: time 1585881000.683077, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 462
Event: time 1585881000.683077, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 247
Event: time 1585881000.683077, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 0
Event: time 1585881000.683077, type 3 (EV_ABS), code 0 (ABS_X), value 462
Event: time 1585881000.683077, type 3 (EV_ABS), code 1 (ABS_Y), value 247
Event: time 1585881000.683077, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 0
Event: time 1585881000.683077, -------------- SYN_REPORT ------------
Event: time 1585881000.694379, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 463
Event: time 1585881000.694379, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 239
Event: time 1585881000.694379, type 3 (EV_ABS), code 0 (ABS_X), value 463
Event: time 1585881000.694379, type 3 (EV_ABS), code 1 (ABS_Y), value 239
Event: time 1585881000.694379, -------------- SYN_REPORT ------------
Event: time 1585881000.705520, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 234
Event: time 1585881000.705520, type 3 (EV_ABS), code 1 (ABS_Y), value 234
Event: time 1585881000.705520, -------------- SYN_REPORT ------------
Event: time 1585881000.716801, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 464
Event: time 1585881000.716801, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 228
Event: time 1585881000.716801, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 20
Event: time 1585881000.716801, type 3 (EV_ABS), code 0 (ABS_X), value 464
Event: time 1585881000.716801, type 3 (EV_ABS), code 1 (ABS_Y), value 228
Event: time 1585881000.716801, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 20
Event: time 1585881000.716801, -------------- SYN_REPORT ------------
Event: time 1585881000.728094, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 222
Event: time 1585881000.728094, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 10
Event: time 1585881000.728094, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 18
Event: time 1585881000.728094, type 3 (EV_ABS), code 1 (ABS_Y), value 222
Event: time 1585881000.728094, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 18
Event: time 1585881000.728094, -------------- SYN_REPORT ------------
Event: time 1585881000.739569, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 465
Event: time 1585881000.739569, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 215
Event: time 1585881000.739569, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 3
Event: time 1585881000.739569, type 3 (EV_ABS), code 0 (ABS_X), value 465
Event: time 1585881000.739569, type 3 (EV_ABS), code 1 (ABS_Y), value 215
Event: time 1585881000.739569, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 3
Event: time 1585881000.739569, -------------- SYN_REPORT ------------
Event: time 1585881000.750672, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 467
Event: time 1585881000.750672, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 204
Event: time 1585881000.750672, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585881000.750672, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 0
Event: time 1585881000.750672, type 3 (EV_ABS), code 0 (ABS_X), value 467
Event: time 1585881000.750672, type 3 (EV_ABS), code 1 (ABS_Y), value 204
Event: time 1585881000.750672, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 0
Event: time 1585881000.750672, -------------- SYN_REPORT ------------
Event: time 1585881000.762105, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 468
Event: time 1585881000.762105, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 196
Event: time 1585881000.762105, type 3 (EV_ABS), code 0 (ABS_X), value 468
Event: time 1585881000.762105, type 3 (EV_ABS), code 1 (ABS_Y), value 196
Event: time 1585881000.762105, -------------- SYN_REPORT ------------
Event: time 1585881000.773451, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 188
Event: time 1585881000.773451, type 3 (EV_ABS), code 1 (ABS_Y), value 188
Event: time 1585881000.773451, -------------- SYN_REPORT ------------
Event: time 1585881000.784708, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 469
Event: time 1585881000.784708, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 181
Event: time 1585881000.784708, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 10
Event: time 1585881000.784708, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 20
Event: time 1585881000.784708, type 3 (EV_ABS), code 0 (ABS_X), value 469
Event: time 1585881000.784708, type 3 (EV_ABS), code 1 (ABS_Y), value 181
Event: time 1585881000.784708, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 20
Event: time 1585881000.784708, -------------- SYN_REPORT ------------
Event: time 1585881000.796053, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 175
Event: time 1585881000.796053, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585881000.796053, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 17
Event: time 1585881000.796053, type 3 (EV_ABS), code 1 (ABS_Y), value 175
Event: time 1585881000.796053, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 17
Event: time 1585881000.796053, -------------- SYN_REPORT ------------
Event: time 1585881000.807382, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 166
Event: time 1585881000.807382, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 14
Event: time 1585881000.807382, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 3
Event: time 1585881000.807382, type 3 (EV_ABS), code 1 (ABS_Y), value 166
Event: time 1585881000.807382, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 3
Event: time 1585881000.807382, -------------- SYN_REPORT ------------
Event: time 1585881000.818486, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 156
Event: time 1585881000.818486, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 13
Event: time 1585881000.818486, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 0
Event: time 1585881000.818486, type 3 (EV_ABS), code 1 (ABS_Y), value 156
Event: time 1585881000.818486, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 0
Event: time 1585881000.818486, -------------- SYN_REPORT ------------
Event: time 1585881000.829740, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 147
Event: time 1585881000.829740, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585881000.829740, type 3 (EV_ABS), code 1 (ABS_Y), value 147
Event: time 1585881000.829740, -------------- SYN_REPORT ------------
Event: time 1585881000.841071, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 138
Event: time 1585881000.841071, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 13
Event: time 1585881000.841071, type 3 (EV_ABS), code 1 (ABS_Y), value 138
Event: time 1585881000.841071, -------------- SYN_REPORT ------------
Event: time 1585881000.852366, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 131
Event: time 1585881000.852366, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 20
Event: time 1585881000.852366, type 3 (EV_ABS), code 1 (ABS_Y), value 131
Event: time 1585881000.852366, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 20
Event: time 1585881000.852366, -------------- SYN_REPORT ------------
Event: time 1585881000.863681, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 125
Event: time 1585881000.863681, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 17
Event: time 1585881000.863681, type 3 (EV_ABS), code 1 (ABS_Y), value 125
Event: time 1585881000.863681, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 17
Event: time 1585881000.863681, -------------- SYN_REPORT ------------
Event: time 1585881000.875100, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 471
Event: time 1585881000.875100, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 116
Event: time 1585881000.875100, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585881000.875100, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 16
Event: time 1585881000.875100, type 3 (EV_ABS), code 0 (ABS_X), value 471
Event: time 1585881000.875100, type 3 (EV_ABS), code 1 (ABS_Y), value 116
Event: time 1585881000.875100, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 16
Event: time 1585881000.875100, -------------- SYN_REPORT ------------
Event: time 1585881000.886348, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 472
Event: time 1585881000.886348, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 108
Event: time 1585881000.886348, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585881000.886348, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 39
Event: time 1585881000.886348, type 3 (EV_ABS), code 0 (ABS_X), value 472
Event: time 1585881000.886348, type 3 (EV_ABS), code 1 (ABS_Y), value 108
Event: time 1585881000.886348, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 39
Event: time 1585881000.886348, -------------- SYN_REPORT ------------
Event: time 1585881000.897636, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 473
Event: time 1585881000.897636, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 101
Event: time 1585881000.897636, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585881000.897636, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 32
Event: time 1585881000.897636, type 3 (EV_ABS), code 0 (ABS_X), value 473
Event: time 1585881000.897636, type 3 (EV_ABS), code 1 (ABS_Y), value 101
Event: time 1585881000.897636, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 32
Event: time 1585881000.897636, -------------- SYN_REPORT ------------
Event: time 1585881000.908939, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 96
Event: time 1585881000.908939, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 45
Event: time 1585881000.908939, type 3 (EV_ABS), code 1 (ABS_Y), value 96
Event: time 1585881000.908939, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 45
Event: time 1585881000.908939, -------------- SYN_REPORT ------------
Event: time 1585881000.920298, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 90
Event: time 1585881000.920298, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 12
Event: time 1585881000.920298, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 52
Event: time 1585881000.920298, type 3 (EV_ABS), code 1 (ABS_Y), value 90
Event: time 1585881000.920298, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 52
Event: time 1585881000.920298, -------------- SYN_REPORT ------------
Event: time 1585881000.931607, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 474
Event: time 1585881000.931607, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 84
Event: time 1585881000.931607, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 11
Event: time 1585881000.931607, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 60
Event: time 1585881000.931607, type 3 (EV_ABS), code 0 (ABS_X), value 474
Event: time 1585881000.931607, type 3 (EV_ABS), code 1 (ABS_Y), value 84
Event: time 1585881000.931607, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 60
Event: time 1585881000.931607, -------------- SYN_REPORT ------------
Event: time 1585881000.942752, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 475
Event: time 1585881000.942752, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 76
Event: time 1585881000.942752, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 9
Event: time 1585881000.942752, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 36
Event: time 1585881000.942752, type 3 (EV_ABS), code 0 (ABS_X), value 475
Event: time 1585881000.942752, type 3 (EV_ABS), code 1 (ABS_Y), value 76
Event: time 1585881000.942752, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 36
Event: time 1585881000.942752, -------------- SYN_REPORT ------------
Event: time 1585881000.954013, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 476
Event: time 1585881000.954013, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 69
Event: time 1585881000.954013, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 8
Event: time 1585881000.954013, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 37
Event: time 1585881000.954013, type 3 (EV_ABS), code 0 (ABS_X), value 476
Event: time 1585881000.954013, type 3 (EV_ABS), code 1 (ABS_Y), value 69
Event: time 1585881000.954013, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 37
Event: time 1585881000.954013, -------------- SYN_REPORT ------------
Event: time 1585881000.965144, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 477
Event: time 1585881000.965144, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 60
Event: time 1585881000.965144, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 90
Event: time 1585881000.965144, type 3 (EV_ABS), code 0 (ABS_X), value 477
Event: time 1585881000.965144, type 3 (EV_ABS), code 1 (ABS_Y), value 60
Event: time 1585881000.965144, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 90
Event: time 1585881000.965144, -------------- SYN_REPORT ------------
Event: time 1585881000.976444, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 478
Event: time 1585881000.976444, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 53
Event: time 1585881000.976444, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 7
Event: time 1585881000.976444, type 3 (EV_ABS), code 0 (ABS_X), value 478
Event: time 1585881000.976444, type 3 (EV_ABS), code 1 (ABS_Y), value 53
Event: time 1585881000.976444, -------------- SYN_REPORT ------------
Event: time 1585881000.987728, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 479
Event: time 1585881000.987728, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 48
Event: time 1585881000.987728, type 3 (EV_ABS), code 0 (ABS_X), value 479
Event: time 1585881000.987728, type 3 (EV_ABS), code 1 (ABS_Y), value 48
Event: time 1585881000.987728, -------------- SYN_REPORT ------------
Event: time 1585881000.998869, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 481
Event: time 1585881000.998869, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 42
Event: time 1585881000.998869, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 6
Event: time 1585881000.998869, type 3 (EV_ABS), code 0 (ABS_X), value 481
Event: time 1585881000.998869, type 3 (EV_ABS), code 1 (ABS_Y), value 42
Event: time 1585881000.998869, -------------- SYN_REPORT ------------
Event: time 1585881001.010167, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 482
Event: time 1585881001.010167, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 38
Event: time 1585881001.010167, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 177
Event: time 1585881001.010167, type 3 (EV_ABS), code 0 (ABS_X), value 482
Event: time 1585881001.010167, type 3 (EV_ABS), code 1 (ABS_Y), value 38
Event: time 1585881001.010167, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 177
Event: time 1585881001.010167, -------------- SYN_REPORT ------------
Event: time 1585881001.021248, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 484
Event: time 1585881001.021248, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 32
Event: time 1585881001.021248, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 8
Event: time 1585881001.021248, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 87
Event: time 1585881001.021248, type 3 (EV_ABS), code 0 (ABS_X), value 484
Event: time 1585881001.021248, type 3 (EV_ABS), code 1 (ABS_Y), value 32
Event: time 1585881001.021248, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 87
Event: time 1585881001.021248, -------------- SYN_REPORT ------------
Event: time 1585881001.032489, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 485
Event: time 1585881001.032489, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 29
Event: time 1585881001.032489, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 9
Event: time 1585881001.032489, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 85
Event: time 1585881001.032489, type 3 (EV_ABS), code 0 (ABS_X), value 485
Event: time 1585881001.032489, type 3 (EV_ABS), code 1 (ABS_Y), value 29
Event: time 1585881001.032489, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 85
Event: time 1585881001.032489, -------------- SYN_REPORT ------------
Event: time 1585881001.043751, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 486
Event: time 1585881001.043751, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 26
Event: time 1585881001.043751, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 10
Event: time 1585881001.043751, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 83
Event: time 1585881001.043751, type 3 (EV_ABS), code 0 (ABS_X), value 486
Event: time 1585881001.043751, type 3 (EV_ABS), code 1 (ABS_Y), value 26
Event: time 1585881001.043751, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 83
Event: time 1585881001.043751, -------------- SYN_REPORT ------------
Event: time 1585881001.055027, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 25
Event: time 1585881001.055027, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 7
Event: time 1585881001.055027, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 85
Event: time 1585881001.055027, type 3 (EV_ABS), code 1 (ABS_Y), value 25
Event: time 1585881001.055027, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 85
Event: time 1585881001.055027, -------------- SYN_REPORT ------------
Event: time 1585881001.066228, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 487
Event: time 1585881001.066228, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 24
Event: time 1585881001.066228, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 6
Event: time 1585881001.066228, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 82
Event: time 1585881001.066228, type 3 (EV_ABS), code 0 (ABS_X), value 487
Event: time 1585881001.066228, type 3 (EV_ABS), code 1 (ABS_Y), value 24
Event: time 1585881001.066228, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 82
Event: time 1585881001.066228, -------------- SYN_REPORT ------------
Event: time 1585881001.077400, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 489
Event: time 1585881001.077400, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 23
Event: time 1585881001.077400, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 5
Event: time 1585881001.077400, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 166
Event: time 1585881001.077400, type 3 (EV_ABS), code 0 (ABS_X), value 489
Event: time 1585881001.077400, type 3 (EV_ABS), code 1 (ABS_Y), value 23
Event: time 1585881001.077400, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 166
Event: time 1585881001.077400, -------------- SYN_REPORT ------------
Event: time 1585881001.088601, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 491
Event: time 1585881001.088601, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 20
Event: time 1585881001.088601, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 4
Event: time 1585881001.088601, type 3 (EV_ABS), code 0 (ABS_X), value 491
Event: time 1585881001.088601, type 3 (EV_ABS), code 1 (ABS_Y), value 20
Event: time 1585881001.088601, -------------- SYN_REPORT ------------
Event: time 1585881001.099843, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 487
Event: time 1585881001.099843, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y)=
, value 19
Event: time 1585881001.099843, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 6
Event: time 1585881001.099843, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 90
Event: time 1585881001.099843, type 3 (EV_ABS), code 0 (ABS_X), value 487
Event: time 1585881001.099843, type 3 (EV_ABS), code 1 (ABS_Y), value 19
Event: time 1585881001.099843, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 90
Event: time 1585881001.099843, -------------- SYN_REPORT ------------
Event: time 1585881001.111667, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X)=
, value 488
Event: time 1585881001.111667, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR=
), value 4
Event: time 1585881001.111667, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), =
value 37
Event: time 1585881001.111667, type 3 (EV_ABS), code 0 (ABS_X), value 488
Event: time 1585881001.111667, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 37
Event: time 1585881001.111667, -------------- SYN_REPORT ------------
Event: time 1585881001.122408, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID=
), value -1
Event: time 1585881001.122408, type 1 (EV_KEY), code 330 (BTN_TOUCH), value=
 0
Event: time 1585881001.122408, type 3 (EV_ABS), code 24 (ABS_PRESSURE), val=
ue 0
Event: time 1585881001.122408, -------------- SYN_REPORT ------------

Denis.

--Sig_/g1YUX0O4Nt5lL+pH2t9ktIQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeC+d2+Nrp/PU3kkGX138wUF34mMFAl7yLQkACgkQX138wUF3
4mOV6RAAgWyGMOINJ1K+WEJLQcpprra9e0LeU6zj3pzQe7wt8Ew0VWOCBqa+kBoa
+JookREGs4/PspW6yFfTKreWibYXJVZn/7Etf0rilEv3GVjMFe3ptP42SnuHaebx
rGcB072hOUUzl9prIiT0+nIl+lZibqdfrjQoULrcOtsBFnO8RwrxOTmr0q6dYeTr
8oa/73N7wr97NFSwMML9QgRTIyCpmjxK5zEAIKhrV8/LCUF6KfKLD+dQGw5Oje99
PqDIUPwb4mYo5jglAP/zxSheEl7Xwe4BjfGc1WICcFTK0PtGBCcEK2h35UfLJAaF
xgQaA7tZGPyJ4QNgwh/s0aQUsJa5Lfk2SXsLGkJRl1ncmiSxpOvLpwO2lfu3YGyh
hzMeNHVDlqyxgMAVNGSCqx6OhYwhuJfxf4qcCLLa/7tFLsMbD82ao2qfEbEsXUFo
TCa1FOA97W2nNIAC6VtkNZVvuoS1Sx43RHIq/NBRwtzwzxHMPlW0nW6BjKE7JT0k
76cwTdjrdasmlNKFxE543LFqln5+vDf5VG5K9qG/6zq0/XyDNpV30xma82V6oKrM
TZZQfxZSac4BZSgWfEp+cOv9mNyiOjPyP0TlR/4fpnI38s1KsfhIwwpCVLt5JZRH
KvA+aHkOZFxemUiiB2xfIY/Pr7u+iCUvL8LH4lbrrMJ0czFa1oU=
=Ei8j
-----END PGP SIGNATURE-----

--Sig_/g1YUX0O4Nt5lL+pH2t9ktIQ--
