Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC4D7267AE
	for <lists+linux-input@lfdr.de>; Wed,  7 Jun 2023 19:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbjFGRoS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Jun 2023 13:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232143AbjFGRoP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Jun 2023 13:44:15 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED7D1210C
        for <linux-input@vger.kernel.org>; Wed,  7 Jun 2023 10:43:54 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-33dbad61311so1905075ab.0
        for <linux-input@vger.kernel.org>; Wed, 07 Jun 2023 10:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686159834; x=1688751834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KHlguvHzTJ62bYZIUlhmWB1cMlEFf8ENKTM1yh0sCU=;
        b=XIicA3wANwdLLqG6kMliRL2fX4pP2GA1dWfr6j/3OJAtR5fqYMkfzPd1B4b43RlfIn
         1CMe5vqM4xx9hgPmkKwtdbI2eXn8vg4uu4fT4Vd68zPXRcVDGNPAe4Y1y9817KafAb25
         gEpRq5IdE4gWB06DasnDV1M4yob8GdjXBE89FEJJXl6ca7yAsn/1yeU3yeHpYuHUjMzl
         8pEH2rDcIBtRLF/KHNiwRgCpu5uIxQ6GXDkO79UQuHYDbxjI4QBkiKpNhuLcT2YS/HMP
         o/yUoemm0Ig6eRIXe4yccEbF2zcIqKSGMNIFGh/B3IEAskVnhVxA3KflcEFA3u/YFgyZ
         VctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686159834; x=1688751834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KHlguvHzTJ62bYZIUlhmWB1cMlEFf8ENKTM1yh0sCU=;
        b=MbpHYkUuZWLQ3kWKlYdiU8AJRrzCLfvCFkTwybsqokW3Mv53hEgcsCFSfDBdBHep5W
         js8CvZOf9tFNpfz9P0xV7vTA+NOvBbW5kxc/PoJaur4TuWAy4FT7dG5akpD2TFneeHrS
         KQxgotATgRZogH84A7TsqAp11YQGBfJwj1ioScnPmRUHLJdLgURpkPSfqVZYtHYqk28J
         K7XAAx7vU4NVT9abvIEo3HFiwe4sCBqEz3+rY5dXzIoFemNjbgi/NkB49yYCYNVln/71
         tyUGZNbrxNO/Bgr+dF8gpOYAT0e6tWI7tj8e+jH+WoKp70VsBSOoUOWxmVz4cGxIqQBX
         NTqA==
X-Gm-Message-State: AC+VfDybZXITK/+Cur91nKRscd7GCCkT/WVUkPJ3DDGl8x+qjygKM1Ul
        YHjjh8t1t6cHYHZtI1ql6kMhDv4QxDln3k1iYJAlyNFy
X-Google-Smtp-Source: ACHHUZ6BmuugXysCxvV11HURNHXtHwfu5bc0wC08iqHR5Bbt8Z2jKqki+TOdGIYzfVVwk6VBhq3nPs698CuV1ukWI5c=
X-Received: by 2002:a05:6e02:b2d:b0:33b:d741:5888 with SMTP id
 e13-20020a056e020b2d00b0033bd7415888mr1642974ilu.0.1686159833984; Wed, 07 Jun
 2023 10:43:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230511194754.129571-1-Joshua@Joshua-Dickens.com>
In-Reply-To: <20230511194754.129571-1-Joshua@Joshua-Dickens.com>
From:   Ping Cheng <pinglinux@gmail.com>
Date:   Wed, 7 Jun 2023 10:43:43 -0700
Message-ID: <CAF8JNh+=buOK8YLQfafowTt1uViGj+M_U8L3RFVV7SbNoQat=w@mail.gmail.com>
Subject: Re: [PATCH] selftests: hid: Add touch tests for Wacom devices
To:     Joshua Dickens <joshua@joshua-dickens.com>
Cc:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Jason Gerecke <killertofu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi maintainers,

Can one of you review the patch and let us know if there is anything
we need to change/update?

Thank you for your effort,
Ping

On Thu, May 11, 2023 at 12:48=E2=80=AFPM Joshua Dickens
<joshua@joshua-dickens.com> wrote:
>
> Adding a wacom touch device to use the test_multitouch tests.
> Adding a 2 additional tests.
>  - A test to check if a touch event is sent when the contact_id of the ev=
ent is 0.
>  - A test to check if a touch event is not sent when confidence is set to=
 0.
>
> Signed-off-by: Joshua Dickens <joshua.dickens@wacom.com>
> Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>
> ---
>  .../selftests/hid/tests/test_wacom_generic.py | 84 ++++++++++++++++++-
>  1 file changed, 81 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/hid/tests/test_wacom_generic.py b/to=
ols/testing/selftests/hid/tests/test_wacom_generic.py
> index b1eb2bc787fc..f92fe8e02c1b 100644
> --- a/tools/testing/selftests/hid/tests/test_wacom_generic.py
> +++ b/tools/testing/selftests/hid/tests/test_wacom_generic.py
> @@ -31,6 +31,7 @@ from enum import Enum
>  from hidtools.hut import HUT
>  from hidtools.hid import HidUnit
>  from . import base
> +from . import test_multitouch
>  import libevdev
>  import pytest
>
> @@ -517,7 +518,7 @@ class BaseTest:
>                  for usage in get_report_usages(report):
>                      yield usage
>
> -        def assertName(self, uhdev):
> +        def assertName(self, uhdev, type):
>              """
>              Assert that the name is as we expect.
>
> @@ -526,7 +527,7 @@ class BaseTest:
>              this assertion from the base class to work properly.
>              """
>              evdev =3D uhdev.get_evdev()
> -            expected_name =3D uhdev.name + " Pen"
> +            expected_name =3D uhdev.name + type
>              if "wacom" not in expected_name.lower():
>                  expected_name =3D "Wacom " + expected_name
>              assert evdev.name =3D=3D expected_name
> @@ -549,6 +550,12 @@ class BaseTest:
>                  usage_id("Generic Desktop", "Y"): PhysRange(
>                      PhysRange.CENTIMETER, 5, 150
>                  ),
> +                usage_id("Digitizers", "Width"): PhysRange(
> +                    PhysRange.CENTIMETER, 5, 150
> +                ),
> +                usage_id("Digitizers", "Height"): PhysRange(
> +                    PhysRange.CENTIMETER, 5, 150
> +                ),
>                  usage_id("Digitizers", "X Tilt"): PhysRange(PhysRange.DE=
GREE, 90, 180),
>                  usage_id("Digitizers", "Y Tilt"): PhysRange(PhysRange.DE=
GREE, 90, 180),
>                  usage_id("Digitizers", "Twist"): PhysRange(PhysRange.DEG=
REE, 358, 360),
> @@ -603,7 +610,17 @@ class BaseTest:
>              pass
>
>
> -class TestOpaqueTablet(BaseTest.TestTablet):
> +class PenTabletTest(BaseTest.TestTablet):
> +    def assertName(self, uhdev):
> +        super().assertName(uhdev, " Pen")
> +
> +
> +class TouchTabletTest(BaseTest.TestTablet):
> +    def assertName(self, uhdev):
> +        super().assertName(uhdev, " Finger")
> +
> +
> +class TestOpaqueTablet(PenTabletTest):
>      def create_device(self):
>          return OpaqueTablet()
>
> @@ -842,3 +859,64 @@ class TestPTHX60_Pen(TestOpaqueCTLTablet):
>                  libevdev.InputEvent(libevdev.EV_KEY.BTN_0, 0),
>              ],
>          )
> +
> +
> +class TestDTH2452Tablet(test_multitouch.BaseTest.TestMultitouch, TouchTa=
bletTest):
> +    def create_device(self):
> +        return test_multitouch.Digitizer(
> +            "DTH 2452",
> +            rdesc=3D"05 0d 09 04 a1 01 85 0c 95 01 75 08 15 00 26 ff 00 =
81 03 09 54 81 02 09 22 a1 02 05 0d 95 01 75 01 25 01 09 42 81 02 81 03 09 =
47 81 02 95 05 81 03 09 51 26 ff 00 75 10 95 01 81 02 35 00 65 11 55 0e 05 =
01 09 30 26 a0 44 46 96 14 81 42 09 31 26 9a 26 46 95 0b 81 42 05 0d 75 08 =
95 01 15 00 09 48 26 5f 00 46 7c 14 81 02 09 49 25 35 46 7d 0b 81 02 45 00 =
65 00 55 00 c0 05 0d 09 22 a1 02 05 0d 95 01 75 01 25 01 09 42 81 02 81 03 =
09 47 81 02 95 05 81 03 09 51 26 ff 00 75 10 95 01 81 02 35 00 65 11 55 0e =
05 01 09 30 26 a0 44 46 96 14 81 42 09 31 26 9a 26 46 95 0b 81 42 05 0d 75 =
08 95 01 15 00 09 48 26 5f 00 46 7c 14 81 02 09 49 25 35 46 7d 0b 81 02 45 =
00 65 00 55 00 c0 05 0d 09 22 a1 02 05 0d 95 01 75 01 25 01 09 42 81 02 81 =
03 09 47 81 02 95 05 81 03 09 51 26 ff 00 75 10 95 01 81 02 35 00 65 11 55 =
0e 05 01 09 30 26 a0 44 46 96 14 81 42 09 31 26 9a 26 46 95 0b 81 42 05 0d =
75 08 95 01 15 00 09 48 26 5f 00 46 7c 14 81 02 09 49 25 35 46 7d 0b 81 02 =
45 00 65 00 55 00 c0 05 0d 09 22 a1 02 05 0d 95 01 75 01 25 01 09 42 81 02 =
81 03 09 47 81 02 95 05 81 03 09 51 26 ff 00 75 10 95 01 81 02 35 00 65 11 =
55 0e 05 01 09 30 26 a0 44 46 96 14 81 42 09 31 26 9a 26 46 95 0b 81 42 05 =
0d 75 08 95 01 15 00 09 48 26 5f 00 46 7c 14 81 02 09 49 25 35 46 7d 0b 81 =
02 45 00 65 00 55 00 c0 05 0d 09 22 a1 02 05 0d 95 01 75 01 25 01 09 42 81 =
02 81 03 09 47 81 02 95 05 81 03 09 51 26 ff 00 75 10 95 01 81 02 35 00 65 =
11 55 0e 05 01 09 30 26 a0 44 46 96 14 81 42 09 31 26 9a 26 46 95 0b 81 42 =
05 0d 75 08 95 01 15 00 09 48 26 5f 00 46 7c 14 81 02 09 49 25 35 46 7d 0b =
81 02 45 00 65 00 55 00 c0 05 0d 27 ff ff 00 00 75 10 95 01 09 56 81 02 75 =
08 95 0e 81 03 09 55 26 ff 00 75 08 b1 02 85 0a 06 00 ff 09 c5 96 00 01 b1 =
02 c0 06 00 ff 09 01 a1 01 09 01 85 13 15 00 26 ff 00 75 08 95 3f 81 02 06 =
00 ff 09 01 15 00 26 ff 00 75 08 95 3f 91 02 c0",
> +            input_info=3D(0x3, 0x056A, 0x0383),
> +        )
> +
> +    def test_contact_id_0(self):
> +        """
> +        Bring a finger in contact with the tablet, then hold it down and=
 remove it.
> +
> +        Ensure that even with contact ID =3D 0 which is usually given as=
 an invalid
> +        touch event by most tablets with the exception of a few, that gi=
ven the
> +        confidence bit is set to 1 it should process it as a valid touch=
 to cover
> +        the few tablets using contact ID =3D 0 as a valid touch value.
> +        """
> +        uhdev =3D self.uhdev
> +        evdev =3D uhdev.get_evdev()
> +
> +        t0 =3D test_multitouch.Touch(0, 50, 100)
> +        r =3D uhdev.event([t0])
> +        events =3D uhdev.next_sync_events()
> +        self.debug_reports(r, uhdev, events)
> +
> +        slot =3D self.get_slot(uhdev, t0, 0)
> +
> +        assert libevdev.InputEvent(libevdev.EV_KEY.BTN_TOUCH, 1) in even=
ts
> +        assert evdev.slots[slot][libevdev.EV_ABS.ABS_MT_TRACKING_ID] =3D=
=3D 0
> +        assert evdev.slots[slot][libevdev.EV_ABS.ABS_MT_POSITION_X] =3D=
=3D 50
> +        assert evdev.slots[slot][libevdev.EV_ABS.ABS_MT_POSITION_Y] =3D=
=3D 100
> +
> +        t0.tipswitch =3D False
> +        if uhdev.quirks is None or "VALID_IS_INRANGE" not in uhdev.quirk=
s:
> +            t0.inrange =3D False
> +        r =3D uhdev.event([t0])
> +        events =3D uhdev.next_sync_events()
> +        self.debug_reports(r, uhdev, events)
> +        assert libevdev.InputEvent(libevdev.EV_KEY.BTN_TOUCH, 0) in even=
ts
> +        assert evdev.slots[slot][libevdev.EV_ABS.ABS_MT_TRACKING_ID] =3D=
=3D -1
> +
> +    def test_confidence_false(self):
> +        """
> +        Bring a finger in contact with the tablet with confidence set to=
 false.
> +
> +        Ensure that the confidence bit being set to false should not res=
ult in a touch event.
> +        """
> +        uhdev =3D self.uhdev
> +        evdev =3D uhdev.get_evdev()
> +
> +        t0 =3D test_multitouch.Touch(1, 50, 100)
> +        t0.confidence =3D False
> +        r =3D uhdev.event([t0])
> +        events =3D uhdev.next_sync_events()
> +        self.debug_reports(r, uhdev, events)
> +
> +        slot =3D self.get_slot(uhdev, t0, 0)
> +
> +        assert not events
> \ No newline at end of file
> --
> 2.40.0
>
