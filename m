Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46D681E59D
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2019 01:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbfENXcK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 May 2019 19:32:10 -0400
Received: from mout.gmx.net ([212.227.15.19]:35805 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726409AbfENXcK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 May 2019 19:32:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1557876718;
        bh=rrE3Xa82tmuO6OZY3KdgGJv31/On/3RLA0KbOVkbv+I=;
        h=X-UI-Sender-Class:Date:To:Cc:Subject:From:In-Reply-To:References;
        b=Pr/0RKL4m42sJkuLxO/6viOCmJAwP+HVXFmHWtsSd9ts7KxSBNU+vNuJB+rsoM/ER
         4+7MD/znbWokicN80jzWDEMhTW+Chv7stsejYWCYmqiCM5gY3hRNSQOegLTaTtYCpf
         JUU0OrFMFH8/lp3H1UIU9m+awRQB9PVQlLYIw9hk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([180.14.199.72]) by mail.gmx.com (mrgmx001
 [212.227.17.184]) with ESMTPSA (Nemesis) id 0Lbdl5-1gxQXu27hr-00lD4f; Wed, 15
 May 2019 01:31:58 +0200
Date:   Tue, 14 May 2019 21:11:32 +0900 (JST)
Message-Id: <20190514.211132.163893957692107837.teika@gmx.com>
To:     Alexander Mikhaylenko <exalm7659@gmail.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.co
Subject: Re: [PATCH] Input: synaptics - enable SMBus on ThinkPad E480 and
 E580
From:   Teika Kazura <teika@gmx.com>
In-Reply-To: <20190421131156.9631-1-exalm7659@gmail.com>
        <CAO-hwJ+U5Y53XNVFwgf4y72hNOU1=zEFOrrjtB4=2Cg6ur18rw@mail.gmail.com>
References: <20190421131156.9631-1-exalm7659@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lyO9F1TTUue6smmVeg3dAD2L7gp6PD/K4/9+Q/kBjWCfgIUkZgm
 GZBpSc6rHYqrbtUx03+I1hNOFGJn69IxgwSZMTdcs7AxqMaWA/+9CUkoso973r4dunaVd49
 TcixuTTTARqhFTcRt3HP4ehk8OeYHX70oFVznHjuKWHcaphvtvr6lqfsXTDqyJTLQ+qSy7N
 WLi5zEo55nFWx+aMjIg6Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Jg3p7Ckdh4M=:XjpU+XNQp5GilX6OaOuwg7
 KglkKldzZFgKCbDUX9ifF9qlHUgwkLSR7aemUotoUNoxWSNRZ3VYi/Q1l0qBI9TkjNHUXnUb2
 G09wcxKzB+j/bM8CSnw86y9EML8vTnaWeVGHPNjEfKZJtKc1SUnZ6yH+cBNUoZLoy4+43ZPJG
 Oveon0MtZD3XV7PRFQvr7dO15VmnvxP/iUKVJcyttXLfZumiuC47ae38nV38TnBrOX0ywUH6J
 VQFbFvWS87MXXVTVALVbrQwBhBRbY5LIQ/O8x11pdKQLNWMMfNB40rZy+CoMYJXD4/6KC9tKB
 0h4MvfdYfd6U4d2laULD2gakAHKDkHo3O9RKXxMkvmx1V6tYqdC4P5VJ4yvunxPhrn7C3/dqL
 kZkmuXkQr8Lbz1cTUthghEldCiW9hYSvyQQf6GRHRI6Hwv8MuI4Eo6UCrCWwE0RGX13bOR9k4
 MwvblStUNh/PXiVk1rr/E/rm5owoiz/HRDbuCP3ZNAUEwUw3GHEQU1ROMUUkUyvCwX6bwtRmb
 FuLzY2gGkGgK+WdvAwpqVZKMO3z32nBTuOHz7d4+KdGZCkuEUkD0bsFRqwhvvsDqvj4sbJxiB
 1OTxxTEJfXupgXd7jd0u/yK/W43OuGwEKa4dHoFh0c7OOJCVwt0TugxsiL52n9G8MFPGsAEj+
 svpS/a65tsoP520uq50SIUUTolRVCoBbqE7W6hctsQnSz87JYIsMdvAYHq+Z2dfKRFnQYFQot
 FrHF4Svg/2fU+iwoNHW9v6tdbH129J4QMq+uhoJMkNp25PjdDSlq0NEwuF5UgL4bCVBW4iqjw
 eN5z+CyZ6EIvuGcCa7UQM1mRsakBkJ3zHfO7I8kg+r9gPUQ1G+8/NUAhubJVnI3lD0aJWYNzI
 Iq/q+WTYM5mMQQ/FnfrxtxvARdrU3OzILqaB20z46SXS4cHmi1W65kTJHY9Gn+
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi, Alexander. If your patch is ok after suspend/hibernation (aka s2ram/s2=
disk), write so and add Benjamin to the cc list:
 Benjamin Tissoires <benjamin.tissoires@redhat.com>

It's likely he'll give reviewed-by to your patch.
# I'm not a kernel developer; simply helping with this ps2 -> rmi4 issue.

Regards,
Teika

From: Alexander Mikhaylenko <exalm7659@gmail.com>
Subject: [PATCH] Input: synaptics - enable SMBus on ThinkPad E480 and E580
Date: Sun, 21 Apr 2019 18:11:56 +0500

> They are capable of using intertouch and it works well with
> psmouse.synaptics_intertouch=3D1, so add them to the list.
>
> Without it, scrolling and gestures are jumpy, three-finger pinch gesture
> doesn't work and three- or four-finger swipes sometimes get stuck.
>
> Signed-off-by: Alexander Mikhaylenko <exalm7659@gmail.com>
> ---
>  drivers/input/mouse/synaptics.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synap=
tics.c
> index b6da0c1267e3..8e6077d8e434 100644
> --- a/drivers/input/mouse/synaptics.c
> +++ b/drivers/input/mouse/synaptics.c
> @@ -179,6 +179,8 @@ static const char * const smbus_pnp_ids[] =3D {
>  	"LEN0096", /* X280 */
>  	"LEN0097", /* X280 -> ALPS trackpoint */
>  	"LEN200f", /* T450s */
> +	"LEN2054", /* E480 */
> +	"LEN2055", /* E580 */
>  	"SYN3052", /* HP EliteBook 840 G4 */
>  	"SYN3221", /* HP 15-ay000 */
>  	NULL
> --
> 2.21.0
>
