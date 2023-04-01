Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD39A6D3274
	for <lists+linux-input@lfdr.de>; Sat,  1 Apr 2023 17:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjDAPuH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 1 Apr 2023 11:50:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjDAPuF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 1 Apr 2023 11:50:05 -0400
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F7526245
        for <linux-input@vger.kernel.org>; Sat,  1 Apr 2023 08:49:58 -0700 (PDT)
Received: by mail-ua1-x92e.google.com with SMTP id ay14so18062933uab.13
        for <linux-input@vger.kernel.org>; Sat, 01 Apr 2023 08:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680364197;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0CQFdO1/DPVm2ZS9BTrmjoVdGns6yKNRFQIXpOqoUL4=;
        b=eqcv7+ThUSS/9HN5La2TZgo+afRScx+i9orGWPDq+0VOxM0vyFHSmI8XYBPDKQXj8y
         LxMlOPv2gUn7EB8YJ+2zkopsVYSRAJBZir68KmduclXin1WthulQyggTfUuf+E7a1Zla
         IKTT37X1IZ+6KUldnKZfWZ5ul+BjTfJu8Y1LTYAS8TuEDTlkkbHJ6WkufPxROf0Fxv2u
         vJLXvJgEbqw+rmPKxyLDJnNu54wtxLf5JPzTJAWq7wng7Smr97/4nspdlhAho2XMJVuO
         ow8wThWTdU9S8Twr4AiU9EXIXXEX2iAyh1HBid1KQECvDEb6XtOVp/VMit0N3wZHJ0yl
         gVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680364197;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0CQFdO1/DPVm2ZS9BTrmjoVdGns6yKNRFQIXpOqoUL4=;
        b=rcnrmSgTq/OG2F30cMZMovo85wl5/abbtlPZoSdRuTTzIlvLxlznL922BQiF3NGM7K
         nlnkUPAirGuVLKd0wGUMvU/w2Ru7SB/KIR8t0XmuaqsK4P7JVnrz+vBTVmnpj23+xaUL
         Avuw5LYA8lthsKJGL9mAtoYv03xV5vITKh3098NK4wI+5CjtWpjigGafLEDL8bqqszZ5
         J4Vujf47CM/gXAz6ANV8YPwXDRNAtUOpJbQi9TFFLwpDaE1nEkduachzVdyi4gnmu2Cd
         VgfSXnhRRKpnOLQEC4f3lrwm2XS22Q5PFZFoG6JV5gXFmAP+9PVX3z4TChw028i9LBVB
         SS6w==
X-Gm-Message-State: AAQBX9cVHHgKVFUiY3Jrx+R+h12+WpmoQs/9yVCYn6qVfgRjAbx0/rTC
        N6DiPzJqkV64SwnTJJSxvPr1iCaON4q98x8eN2/KqNsCT0s=
X-Google-Smtp-Source: AKy350Zc7v8BF91+OHBIAgnQ0TlWbefOWdgo7u2ppLPQ63XUqgIpdaGpB9BkzuftbsevBltIYJWUhn8WE62uGnXyGEY=
X-Received: by 2002:a05:6130:c84:b0:663:e17a:e5f6 with SMTP id
 ch4-20020a0561300c8400b00663e17ae5f6mr22584740uab.2.1680364196605; Sat, 01
 Apr 2023 08:49:56 -0700 (PDT)
MIME-Version: 1.0
From:   Daniel Bareiro <dbareiro@gmail.com>
Date:   Sat, 1 Apr 2023 12:49:45 -0300
Message-ID: <CABVmo5T905s4L5sykT8Ak+XMVdGORzD-kHkirJpC7pWieQjqqQ@mail.gmail.com>
Subject: TPPS/2 IBM TrackPoint not working in Linux 6.1 and 5.14
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear Linux developers,

First of all, thank you for the work you do with your contributions every d=
ay.
Much appreciated.

I have been having problems for some time to be able to use the trackpoint
(the red button with mouse functions) that the keyboard of my Thinkpad T530=
 has.

I have had this problem in Debian 11 with Linux 5.14 and now in Debian
Testing with Linux 6.1.

I think this setting should enable the Trackpoint:

root@orion:~# cat /etc/modprobe.d/psmouse.conf
options psmouse synaptics_intertouch=3D1 proto=3Dany

In fact, after this configuration I am able to see it with xinput:

viper@orion:~$ xinput
=E2=8E=A1 Virtual core pointer                          id=3D2    [master p=
ointer  (3)]
=E2=8E=9C   =E2=86=B3 Virtual core XTEST pointer                id=3D4    [=
slave  pointer  (2)]
=E2=8E=9C   =E2=86=B3  USB OPTICAL MOUSE                        id=3D9    [=
slave  pointer  (2)]
=E2=8E=9C   =E2=86=B3 TPPS/2 IBM TrackPoint                     id=3D12   [=
slave  pointer  (2)]
=E2=8E=A3 Virtual core keyboard                         id=3D3    [master k=
eyboard (2)]
   =E2=86=B3 Virtual core XTEST keyboard               id=3D5    [slave  ke=
yboard (3)]
   =E2=86=B3 Power Button                              id=3D6    [slave  ke=
yboard (3)]
   =E2=86=B3 Video Bus                                 id=3D7    [slave  ke=
yboard (3)]
   =E2=86=B3 Sleep Button                              id=3D8    [slave  ke=
yboard (3)]
   =E2=86=B3 Integrated Camera: Integrated C           id=3D10   [slave  ke=
yboard (3)]
   =E2=86=B3 AT Translated Set 2 keyboard              id=3D11   [slave  ke=
yboard (3)]
   =E2=86=B3 ThinkPad Extra Buttons                    id=3D13   [slave  ke=
yboard (3)]


But it does not work. A look in syslog shows the following:

root@orion:~# tail -F /var/log/syslog
2023-04-01T11:48:57.295761-03:00 orion kernel: [  634.652388] psmouse
serio1: Failed to enable mouse on isa0060/serio1
2023-04-01T11:48:57.959746-03:00 orion kernel: [  635.316599] psmouse
serio1: Failed to enable mouse on isa0060/serio1
2023-04-01T11:48:58.623769-03:00 orion kernel: [  635.978783] psmouse
serio1: Failed to enable mouse on isa0060/serio1
2023-04-01T11:48:59.287780-03:00 orion kernel: [  636.642962] psmouse
serio1: Failed to enable mouse on isa0060/serio1
2023-04-01T11:48:59.955781-03:00 orion kernel: [  637.311116] psmouse
serio1: Failed to enable mouse on isa0060/serio1
2023-04-01T11:49:00.619767-03:00 orion kernel: [  637.975234] psmouse
serio1: Failed to enable mouse on isa0060/serio1
2023-04-01T11:49:01.279768-03:00 orion kernel: [  638.636391] psmouse
serio1: Failed to enable mouse on isa0060/serio1
2023-04-01T11:49:01.951713-03:00 orion kernel: [  639.306422] psmouse
serio1: Failed to enable mouse on isa0060/serio1
2023-04-01T11:49:02.615760-03:00 orion kernel: [  639.970611] psmouse
serio1: Failed to enable mouse on isa0060/serio1
---------------

Using this setup I am able to enable the Trackpoint, although it is
detected as a
PS/2 mouse and it is extremely slow:

root@orion:~# cat /etc/modprobe.d/psmouse.conf
options psmouse synaptics_intertouch=3D1 proto=3Dexps

viper@orion:~$ xinput
=E2=8E=A1 Virtual core pointer                          id=3D2    [master p=
ointer  (3)]
=E2=8E=9C   =E2=86=B3 Virtual core XTEST pointer                id=3D4    [=
slave  pointer  (2)]
=E2=8E=9C   =E2=86=B3  USB OPTICAL MOUSE                        id=3D9    [=
slave  pointer  (2)]
=E2=8E=9C   =E2=86=B3 PS/2 Generic Mouse                        id=3D12   [=
slave  pointer  (2)]
=E2=8E=A3 Virtual core keyboard                         id=3D3    [master k=
eyboard (2)]
   =E2=86=B3 Virtual core XTEST keyboard               id=3D5    [slave  ke=
yboard (3)]
   =E2=86=B3 Power Button                              id=3D6    [slave  ke=
yboard (3)]
   =E2=86=B3 Video Bus                                 id=3D7    [slave  ke=
yboard (3)]
   =E2=86=B3 Sleep Button                              id=3D8    [slave  ke=
yboard (3)]
   =E2=86=B3 Integrated Camera: Integrated C           id=3D10   [slave  ke=
yboard (3)]
   =E2=86=B3 AT Translated Set 2 keyboard              id=3D11   [slave  ke=
yboard (3)]
   =E2=86=B3 ThinkPad Extra Buttons                    id=3D13   [slave  ke=
yboard (3)]

root@orion:~# tail -F /var/log/syslog
2023-04-01T11:50:59.559695-03:00 orion kernel: [  756.915044] psmouse
serio1: Failed to enable mouse on isa0060/serio1
2023-04-01T11:51:03.475677-03:00 orion kernel: [  760.833751] input:
PS/2 Generic Mouse as /devices/platform/i8042/serio1/input/input23
2023-04-01T11:51:06.334813-03:00 orion (udev-worker)[4466]: input23:
/etc/udev/rules.d/10-trackpoint.rules:1 Failed to write
ATTR{/sys/devices/platform/i8042/serio1/i>
2023-04-01T11:51:06.967054-03:00 orion kded5[4476]: Initializing
"/usr/lib/x86_64-linux-gnu/qt5/plugins/plasma/kcms/systemsettings/kcm_mouse=
.so"
2023-04-01T11:51:07.884147-03:00 orion kded5[4476]: Initializing
"/usr/lib/x86_64-linux-gnu/qt5/plugins/plasma/kcms/systemsettings/kcm_touch=
pad.so"
2023-04-01T11:51:07.884468-03:00 orion kded5[4476]: kcm_touchpad:
Using X11 backend
2023-04-01T11:51:07.885260-03:00 orion kwin_x11[2328]: qt.qpa.xcb:
QXcbConnection: XCB error: 3 (BadWindow), sequence: 6268, resource id:
60817413, major code: 18 (Ch>


Here's some more information, though if there's anything else I can provide=
 to
help resolve this, please let me know:

root@orion:~# dmesg | grep -i Trackpoint
[  535.610685] psmouse serio1: trackpoint: IBM TrackPoint firmware:
0x0e, buttons: 3/3
[  535.661460] input: TPPS/2 IBM TrackPoint as
/devices/platform/i8042/serio1/input/input20


Since the Trankpoint works perfectly in KDE under FreeBSD detecting it as
"TPPS/2 IBM TrackPoint", I think this is more of a software problem than a
hardware one.

Thanks in advance.

Kind regards,
Daniel
