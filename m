Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610EB474291
	for <lists+linux-input@lfdr.de>; Tue, 14 Dec 2021 13:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233983AbhLNMbz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Dec 2021 07:31:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39667 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233992AbhLNMby (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Dec 2021 07:31:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639485114;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=01k8VryRrq+hfX184AWjTCDc3yypJM/0jG7B4R15oqg=;
        b=LW9iWvaTmdi3hh1+9d6YIDd8YGW2Lk3TcK6WDogRNahyxF9kGSUoTRRyWTrDnJYx7yIGEm
        La9B1MofrTG1eMD+IM1UxeRcDves1J8Ml2paPLWcocFPKOk00ifDts7XJKK1z/pj/FUMEn
        ZmHAgYg7Rgx5pYPvvDE5Fuensxf7xZ0=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-Mmmkm93wPTOaa0id2e4_Lw-1; Tue, 14 Dec 2021 07:31:50 -0500
X-MC-Unique: Mmmkm93wPTOaa0id2e4_Lw-1
Received: by mail-pf1-f197.google.com with SMTP id a23-20020a62bd17000000b004a3f6892612so11736837pff.22
        for <linux-input@vger.kernel.org>; Tue, 14 Dec 2021 04:31:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=01k8VryRrq+hfX184AWjTCDc3yypJM/0jG7B4R15oqg=;
        b=HyxbG2GMc9rdssQJ14w1TF/6Du3jsH6zGla6IXiLAn2rEHxmahKdDIwzIN8WrTYOmq
         x8b8fv9vMVeuEygizrL2ezSvZuTmSyahOEZUyHujXZcX5Ub3MbVn1giKpoy8W4L2VdxH
         0Z3aFbUz/DWOCTxqs8p2tn6vgZaCPU5iiyRnteTkfT596mk2L+kGmRMz8b/689JiMsBI
         RdbAqW+vTNX3R4CB4Zwn8MP2SNO0Jc4EVCRCiLnYanavHujQ3Xailqg7Hhg6AwRPRLdV
         yKgo4N3zrEe9KMFD/dq7fW8ILcXM3jqC8BBgBrnZg41bbrCJLZsZ/KqcZaGADw4RtXfK
         9JVA==
X-Gm-Message-State: AOAM530bOmGquMZ3LH+z2is8DdYOvB+JzOXhiOgBNMFBjueG4wROAIGX
        NpeqFx9Ynttq5JOEYByWxbs86NB4ahfL1N+DFkJ3Cig6DtZ0SRvPAWQbui7uSZrP7K65q2wV+8/
        7YtRFcO6iLPnlw9N/CEFd9Vt5JIz9QRk5CDMgq9I=
X-Received: by 2002:a63:ea51:: with SMTP id l17mr3517627pgk.363.1639485109664;
        Tue, 14 Dec 2021 04:31:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpmFK2OLAd9iYozTh1YSvtM7rav3/I4yGUM7fQ6tIbRePjMcHAUqKdTvKmdmK4jB+0NYPwU087yICjhqF53n4=
X-Received: by 2002:a63:ea51:: with SMTP id l17mr3517606pgk.363.1639485109341;
 Tue, 14 Dec 2021 04:31:49 -0800 (PST)
MIME-Version: 1.0
References: <20211130132957.8480-1-andrealmeid@collabora.com> <20211130132957.8480-2-andrealmeid@collabora.com>
In-Reply-To: <20211130132957.8480-2-andrealmeid@collabora.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 14 Dec 2021 13:31:38 +0100
Message-ID: <CAO-hwJLKbomKLfvbNMON0E_uHO3AK1d1ZuPAHKqb2M31PBw5tw@mail.gmail.com>
Subject: Re: [PATCH 1/1] HID: hidraw: Replace hidraw device table mutex with a rwsem
To:     =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 30, 2021 at 2:36 PM Andr=C3=A9 Almeida <andrealmeid@collabora.c=
om> wrote:
>
> Currently, the table that stores information about the connected hidraw
> devices has a mutex to prevent concurrent hidraw users to manipulate the
> hidraw table (e.g. delete an entry) while someone is trying to use
> the table (e.g. issuing an ioctl to the device), preventing the kernel
> to referencing a NULL pointer. However, since that every user that wants
> to access the table for both manipulating it and reading it content,
> this prevents concurrent access to the table for read-only operations
> for different or the same device (e.g. two hidraw ioctls can't happen at
> the same time, even if they are completely unrelated).
>
> This proves to be a bottleneck and gives performance issues when using
> multiple HID devices at same time, like VR kits where one can have two
> controllers, the headset and some tracking sensors.
>
> To improve the performance, replace the table mutex with a read-write
> semaphore, enabling multiple threads to issue parallel syscalls to
> multiple devices at the same time while protecting the table for
> concurrent modifications.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@collabora.com>
> ---

Patch looks good to me.

Applied to for-5.17/hidraw.

Thanks!

Cheers,
Benjamin

>  drivers/hid/hidraw.c | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/hid/hidraw.c b/drivers/hid/hidraw.c
> index 79faac87a06f..681614a8302a 100644
> --- a/drivers/hid/hidraw.c
> +++ b/drivers/hid/hidraw.c
> @@ -34,7 +34,7 @@ static int hidraw_major;
>  static struct cdev hidraw_cdev;
>  static struct class *hidraw_class;
>  static struct hidraw *hidraw_table[HIDRAW_MAX_DEVICES];
> -static DEFINE_MUTEX(minors_lock);
> +static DECLARE_RWSEM(minors_rwsem);
>
>  static ssize_t hidraw_read(struct file *file, char __user *buffer, size_=
t count, loff_t *ppos)
>  {
> @@ -107,7 +107,7 @@ static ssize_t hidraw_send_report(struct file *file, =
const char __user *buffer,
>         __u8 *buf;
>         int ret =3D 0;
>
> -       lockdep_assert_held(&minors_lock);
> +       lockdep_assert_held(&minors_rwsem);
>
>         if (!hidraw_table[minor] || !hidraw_table[minor]->exist) {
>                 ret =3D -ENODEV;
> @@ -160,9 +160,9 @@ static ssize_t hidraw_send_report(struct file *file, =
const char __user *buffer,
>  static ssize_t hidraw_write(struct file *file, const char __user *buffer=
, size_t count, loff_t *ppos)
>  {
>         ssize_t ret;
> -       mutex_lock(&minors_lock);
> +       down_read(&minors_rwsem);
>         ret =3D hidraw_send_report(file, buffer, count, HID_OUTPUT_REPORT=
);
> -       mutex_unlock(&minors_lock);
> +       up_read(&minors_rwsem);
>         return ret;
>  }
>
> @@ -182,7 +182,7 @@ static ssize_t hidraw_get_report(struct file *file, c=
har __user *buffer, size_t
>         int ret =3D 0, len;
>         unsigned char report_number;
>
> -       lockdep_assert_held(&minors_lock);
> +       lockdep_assert_held(&minors_rwsem);
>
>         if (!hidraw_table[minor] || !hidraw_table[minor]->exist) {
>                 ret =3D -ENODEV;
> @@ -272,7 +272,7 @@ static int hidraw_open(struct inode *inode, struct fi=
le *file)
>                 goto out;
>         }
>
> -       mutex_lock(&minors_lock);
> +       down_read(&minors_rwsem);
>         if (!hidraw_table[minor] || !hidraw_table[minor]->exist) {
>                 err =3D -ENODEV;
>                 goto out_unlock;
> @@ -301,7 +301,7 @@ static int hidraw_open(struct inode *inode, struct fi=
le *file)
>         spin_unlock_irqrestore(&hidraw_table[minor]->list_lock, flags);
>         file->private_data =3D list;
>  out_unlock:
> -       mutex_unlock(&minors_lock);
> +       up_read(&minors_rwsem);
>  out:
>         if (err < 0)
>                 kfree(list);
> @@ -347,7 +347,7 @@ static int hidraw_release(struct inode * inode, struc=
t file * file)
>         struct hidraw_list *list =3D file->private_data;
>         unsigned long flags;
>
> -       mutex_lock(&minors_lock);
> +       down_write(&minors_rwsem);
>
>         spin_lock_irqsave(&hidraw_table[minor]->list_lock, flags);
>         list_del(&list->node);
> @@ -356,7 +356,7 @@ static int hidraw_release(struct inode * inode, struc=
t file * file)
>
>         drop_ref(hidraw_table[minor], 0);
>
> -       mutex_unlock(&minors_lock);
> +       up_write(&minors_rwsem);
>         return 0;
>  }
>
> @@ -369,7 +369,7 @@ static long hidraw_ioctl(struct file *file, unsigned =
int cmd,
>         struct hidraw *dev;
>         void __user *user_arg =3D (void __user*) arg;
>
> -       mutex_lock(&minors_lock);
> +       down_read(&minors_rwsem);
>         dev =3D hidraw_table[minor];
>         if (!dev || !dev->exist) {
>                 ret =3D -ENODEV;
> @@ -487,7 +487,7 @@ static long hidraw_ioctl(struct file *file, unsigned =
int cmd,
>                 ret =3D -ENOTTY;
>         }
>  out:
> -       mutex_unlock(&minors_lock);
> +       up_read(&minors_rwsem);
>         return ret;
>  }
>
> @@ -546,7 +546,7 @@ int hidraw_connect(struct hid_device *hid)
>
>         result =3D -EINVAL;
>
> -       mutex_lock(&minors_lock);
> +       down_write(&minors_rwsem);
>
>         for (minor =3D 0; minor < HIDRAW_MAX_DEVICES; minor++) {
>                 if (hidraw_table[minor])
> @@ -557,7 +557,7 @@ int hidraw_connect(struct hid_device *hid)
>         }
>
>         if (result) {
> -               mutex_unlock(&minors_lock);
> +               up_write(&minors_rwsem);
>                 kfree(dev);
>                 goto out;
>         }
> @@ -567,7 +567,7 @@ int hidraw_connect(struct hid_device *hid)
>
>         if (IS_ERR(dev->dev)) {
>                 hidraw_table[minor] =3D NULL;
> -               mutex_unlock(&minors_lock);
> +               up_write(&minors_rwsem);
>                 result =3D PTR_ERR(dev->dev);
>                 kfree(dev);
>                 goto out;
> @@ -583,7 +583,7 @@ int hidraw_connect(struct hid_device *hid)
>         dev->exist =3D 1;
>         hid->hidraw =3D dev;
>
> -       mutex_unlock(&minors_lock);
> +       up_write(&minors_rwsem);
>  out:
>         return result;
>
> @@ -594,11 +594,11 @@ void hidraw_disconnect(struct hid_device *hid)
>  {
>         struct hidraw *hidraw =3D hid->hidraw;
>
> -       mutex_lock(&minors_lock);
> +       down_write(&minors_rwsem);
>
>         drop_ref(hidraw, 1);
>
> -       mutex_unlock(&minors_lock);
> +       up_write(&minors_rwsem);
>  }
>  EXPORT_SYMBOL_GPL(hidraw_disconnect);
>
> --
> 2.34.1
>

