Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85F3124954E
	for <lists+linux-input@lfdr.de>; Wed, 19 Aug 2020 08:53:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgHSGxg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Aug 2020 02:53:36 -0400
Received: from mout.web.de ([212.227.17.11]:37007 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726751AbgHSGxd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Aug 2020 02:53:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1597819985;
        bh=zbAovNYHYVj9b7GS0MasMl9nnZWPfpSPFLXNzvGNNYc=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
        b=sZC4lsqqn+Kaed7Y+Q0pgm7uV46gpRLRWg5CfgKJ6xPy4y+XShOfH9imUj35k1HF9
         hU2b74pCsEF6OO82H1+l5mXZgOf43WujunTM93lWTZdDiy40QPFo1AQdXg/hmzB59S
         Pwe0z/ytAf/1w4cVVRVU0j6Ixhige1Xq3odB3rQ0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from Neuromancer.fritz.box ([2.202.13.221]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M1GAG-1kwffN0R9k-00tBM2; Wed, 19
 Aug 2020 08:53:05 +0200
Message-ID: <1597819984.4101.16.camel@web.de>
Subject: Re: [PATCH] HID: roccat: add bounds checking in
 kone_sysfs_write_settings()
From:   Stefan Achatz <stefan_achatz@web.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Stefan Achatz <erazor_de@users.sourceforge.net>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Date:   Wed, 19 Aug 2020 08:53:04 +0200
In-Reply-To: <20200805095501.GD483832@mwanda>
References: <20200805095501.GD483832@mwanda>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 (3.26.6-1.fc27) 
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Rs9MzHG1qjI3CG7K3NLpjAJPeQM6OaxvsjMjqBri1KU9hx1mhI4
 O1Pl1GkiX7SXO+DzET1/4szZD3xn/lU8aENIruNUZs01mwEzlx1XyL+uixc6k+vgcKHfKTd
 bViFAniGQyUT2ocaL5D2ijhUre41TuhAWXGLRTLKQinf05X69V0pwY9350Rlqu8rP3yOWKC
 Zrx8/xflXJRuxx+qyTpHA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/u3Case0BA8=:JGgDNp2N2q81s9rrN3Q2U5
 JLR6J2bQyn/LcARhIADjILZ2DWmltIL5xtxjSQPYnPjY0Upg3/k2xOjc568abrsXF27ajGWhA
 lxSQAqpGq1TtOkJVVd+9RnEX4JPsCYX46skWb24JG8nrhAadr2I+w/7EqNiHBfFhznPl+IVaC
 7esMPTDHhqxc1gqHma5H1Q3jZ724OT6dqZ43kqgo25Fvok6J0+GZWVjNF8fY38ehrepliKanL
 pE4uOWh8T74r+WViEbmTq0gm4xwXqhwi3T2uU7wEVtoVEsMHYzohLVdjKk1fHj5mCtSsXGjka
 gm11bLQsRChTFnLDVfFF1Xvxiep1r5x3plv/eQN1QNPO3yOhEpMMeLqScENVvsvztIUgD3fk5
 9NYUSdNYVRh0KZ9B7cGdAJPXXeRw1tQECQGfrociIFBl0Sp/x2RB9jDC0EfA53uLHBTLbv7ZK
 Yci78AtcAzFtV0ScTvasGEamd1nLE76wtneC3FSAltQIr8v7tuQ+r7Vgid9rMYN6/xPyNaH9/
 hx1yxhe8WfF89BPI8M1IKShAM96MxiP+8dRM21MnTZ26HBZxYlRvapdvB+Od+wzAjsAecxHVB
 /4NBwTB3PtlUkh+sgbE/XepQprYciADAQJMm1bV4Ivvzwg9ZCukT2/Gr3ZVdnOa2zFSWjYn7O
 pBKluEPCeBi+gtLqtyrZd0d0ktTlDsu3DsguFgptgVvjP5UzLjSq2ee54W+UAPrY3OIkJMviC
 8W4vqDQn1qHA0rOWsTBp/FuuIqvHLr2lJRvrT42EvcM7MtEGEyB1rG5lMVk+ZYIyo0tc3Nq2j
 ehiJ4yqCIMkn0nbK9009Uj7Q6wxw0gg0gyEoqxzCUjOOZyeIsMnBIAU41naNz69iL1wS4BcQz
 3g/69y8XfrIvkRwOg0gMfs8SxiCJORMQJqxORDCpGPjWjGahY0FCGpBte+w3R8VPoYhKMVbLB
 09XNAiBwL4iUDTzctZvr2JIgLG8RQx7ZsyMU5LJDL6EUWXtl3DuQZ7TWvf2GthHpIGRoxGhUx
 qa8424PKd/E0nmvoR+lzFr6yHFImc3sDN/R9OXkkdJLivBP211dWFs0f56RK62L1YWeL6OXC5
 IOVYF1zyUvyEPDC81uNKqlOoUUd/yJR1PAm+CZFgUZXDF4Sv3wz24V6JCN5mnIAulgwIHDJmY
 6N4DY9B+0oJcRPqXFXemyANb7FjRI8r9NLkB+xDwejVW1B1XmZVJ+WxiTzlysU07XH2MaVYWT
 yKtBVbF6zS6bVta5NXSXJeAEfMwycfGXoh3xpAw==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Please remove the settings->size check. The driver sometimes just
writes a modified version of the read settings data. This would fail if
stored size is invalid. This value of size is not solely in my hands, I
can't guarantee Windows driver does a sanity check, also cases of flash
data corruption are known.

My general design agenda is that in my userspace tools I make sure only
valid data (to the best of knowledge) is prepared for the device. In
the kernel driver I don't (or didn't) do additional checks and
eventually let the hardware reject things it doesn't like. This way the
kernel driver doesn't need an update if firmware updates change the
binary interface. This happend in the past, but won't for this device
anymore because it's oop for years.

Am Mittwoch, den 05.08.2020, 12:55 +0300 schrieb Dan Carpenter:
> In the original code we didn't check if the new value for
> "settings->startup_profile" was within bounds that could possibly
> result in an out of bounds array acccess.  What we did was we checked
> if
> we could write the data to the firmware and it's possibly the
> firmware
> checks these values but there is no way to know.  It's safer and
> easier
> to read if we check it in the kernel as well.
>
> I also added a check to ensure that "settings->size" was
> correct.  The
> comments say that the only valid value is 36 which is sizeof(struct
> kone_settings).
>
> Fixes: 14bf62cde794 ("HID: add driver for Roccat Kone gaming mouse")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This isn't tested.  Checking settings->size seems like a good idea,
> but
> there is a slight risky because maybe invalid values used to be
> allowed
> and I don't want to break user space.
>
>  drivers/hid/hid-roccat-kone.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/hid/hid-roccat-kone.c b/drivers/hid/hid-roccat-
> kone.c
> index 1a6e600197d0..5e8e1517f23c 100644
> --- a/drivers/hid/hid-roccat-kone.c
> +++ b/drivers/hid/hid-roccat-kone.c
> @@ -294,31 +294,41 @@ static ssize_t kone_sysfs_write_settings(struct
> file *fp, struct kobject *kobj,
>  	struct kone_device *kone =3D
> hid_get_drvdata(dev_get_drvdata(dev));
>  	struct usb_device *usb_dev =3D
> interface_to_usbdev(to_usb_interface(dev));
>  	int retval =3D 0, difference, old_profile;
> +	struct kone_settings *settings =3D (struct kone_settings
> *)buf;
>
>  	/* I need to get my data in one piece */
>  	if (off !=3D 0 || count !=3D sizeof(struct kone_settings))
>  		return -EINVAL;
>
>  	mutex_lock(&kone->kone_lock);
> -	difference =3D memcmp(buf, &kone->settings, sizeof(struct
> kone_settings));
> +	difference =3D memcmp(settings, &kone->settings,
> +			    sizeof(struct kone_settings));
>  	if (difference) {
> -		retval =3D kone_set_settings(usb_dev,
> -				(struct kone_settings const *)buf);
> -		if (retval) {
> -			mutex_unlock(&kone->kone_lock);
> -			return retval;
> +		if (settings->size !=3D sizeof(struct kone_settings)
> ||
> +		    settings->startup_profile < 1 ||
> +		    settings->startup_profile > 5) {
> +			retval =3D -EINVAL;
> +			goto unlock;
>  		}
>
> +		retval =3D kone_set_settings(usb_dev, settings);
> +		if (retval)
> +			goto unlock;
> +
>  		old_profile =3D kone->settings.startup_profile;
> -		memcpy(&kone->settings, buf, sizeof(struct
> kone_settings));
> +		memcpy(&kone->settings, settings, sizeof(struct
> kone_settings));
>
>  		kone_profile_activated(kone, kone-
> >settings.startup_profile);
>
>  		if (kone->settings.startup_profile !=3D old_profile)
>  			kone_profile_report(kone, kone-
> >settings.startup_profile);
>  	}
> +unlock:
>  	mutex_unlock(&kone->kone_lock);
>
> +	if (retval)
> +		return retval;
> +
>  	return sizeof(struct kone_settings);
>  }
>  static BIN_ATTR(settings, 0660, kone_sysfs_read_settings,
