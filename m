Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 671AA29AC5E
	for <lists+linux-input@lfdr.de>; Tue, 27 Oct 2020 13:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2900148AbgJ0Mmj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Oct 2020 08:42:39 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:38878 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440517AbgJ0Mmi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Oct 2020 08:42:38 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 6465B1C0B7F; Tue, 27 Oct 2020 13:42:36 +0100 (CET)
Date:   Tue, 27 Oct 2020 13:42:35 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     jkosina@suse.cz, dmitry.torokhov@gmail.com, vojtech@suse.cz,
        linux-input@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>
Subject: Proper support for Saitek X36F joystick
Message-ID: <20201027124235.GA27148@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

This is from 4.19, but I doubt this changed recently.

Saitek X36F+X35T combination is detected like this... in short one
hat, no switches, and lot of buttons.

In reality, combination has 4 four-way switches (hats?), 2 slider
switches (three positions) and lot less buttons. Sliders and 3 of 4
hats are detected as groups of buttons. Last hat is strange, I can't
see anything that corresponds to it on evtest, and as long as it is
pushed in any direction, all the other events stop. (It is also one
I'd like to use).

What needs to be done to get more useful mapping for userspace?

Is there any easy way to debug the hat that breaks everything?

Best regards,
								Pavel

$ evtest /dev/input/by-id/usb-Saitek_Saitek_X36_00103464-event-joystick
Input driver version is 1.0.1
Input device ID: bus 0x3 vendor 0x6a3 product 0x53f version 0x100
Input device name: "Saitek Saitek X36"
Supported events:
  Event type 0 (EV_SYN)
  Event type 1 (EV_KEY)
    Event code 288 (BTN_TRIGGER)
    Event code 289 (BTN_THUMB)
    Event code 290 (BTN_THUMB2)
    Event code 291 (BTN_TOP)
    Event code 292 (BTN_TOP2)
    Event code 293 (BTN_PINKIE)
    Event code 294 (BTN_BASE)
    Event code 295 (BTN_BASE2)
    Event code 296 (BTN_BASE3)
    Event code 297 (BTN_BASE4)
    Event code 298 (BTN_BASE5)
    Event code 299 (BTN_BASE6)
    Event code 300 (?)
    Event code 301 (?)
    Event code 302 (?)
    Event code 303 (BTN_DEAD)
    Event code 704 (BTN_TRIGGER_HAPPY1)
    Event code 705 (BTN_TRIGGER_HAPPY2)
    Event code 706 (BTN_TRIGGER_HAPPY3)
    Event code 707 (BTN_TRIGGER_HAPPY4)
    Event code 708 (BTN_TRIGGER_HAPPY5)
    Event code 709 (BTN_TRIGGER_HAPPY6)
    Event code 710 (BTN_TRIGGER_HAPPY7)
    Event code 711 (BTN_TRIGGER_HAPPY8)
    Event code 712 (BTN_TRIGGER_HAPPY9)
    Event code 713 (BTN_TRIGGER_HAPPY10)
  Event type 3 (EV_ABS)
    Event code 0 (ABS_X)
      Value    211
      Min       76
      Max      364
      Flat      18
    Event code 1 (ABS_Y)
      Value    219
      Min       76
      Max      404
      Flat      20
    Event code 3 (ABS_RX)
      Value    225
      Min        1
      Max      225
      Flat      14
    Event code 5 (ABS_RZ)
      Value    156
      Min       21
      Max      241
      Flat      13
    Event code 6 (ABS_THROTTLE)
      Value    235
      Min       21
      Max      235
      Flat      13
    Event code 7 (ABS_RUDDER)
      Value      1
      Min        1
      Max      209
      Flat      13
    Event code 16 (ABS_HAT0X)
      Value      0
      Min       -1
      Max        1
    Event code 17 (ABS_HAT0Y)
      Value      0
      Min       -1
      Max        1
  Event type 4 (EV_MSC)
    Event code 4 (MSC_SCAN)
Properties:
Testing ... (interrupt to exit)

--=20
http://www.livejournal.com/~pavelmachek

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX5gVuwAKCRAw5/Bqldv6
8ookAJ9FGbgWf3SwZcirxxCXtiLWYHCKMgCfX/KCIfkaFGAqZU1GFC/OTdAdEH0=
=wULs
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
