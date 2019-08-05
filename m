Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 279DF81931
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2019 14:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728144AbfHEMYY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Aug 2019 08:24:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:58338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727259AbfHEMYY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 5 Aug 2019 08:24:24 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F010020880;
        Mon,  5 Aug 2019 12:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565007863;
        bh=Oj3FPFXjuZW8aPht4bbn3YgVA2X/7dkzPDjsNfH4nDc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=rc67jfov6f45X1oYV0lXMBU96xnOstBh/8Wg3OI5C2o0BxO1BSdtBmM1vNkWAgIUc
         j5ly81QJ4W/0Ql98gioJ5SB8T2fIG2+a4Yr39gyADL5XXNwVZlAzInsYNL+gqU/XO7
         ce4eHcUuZzytfdLwAUSSzalZLcr3vNXcdLp9ndLo=
Date:   Mon, 5 Aug 2019 14:24:18 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hillf Danton <hdanton@sina.com>
cc:     syzbot <syzbot+62a1e04fd3ec2abf099e@syzkaller.appspotmail.com>,
        andreyknvl@google.com, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: KASAN: use-after-free Read in hiddev_release
In-Reply-To: <20190805081212.3144-1-hdanton@sina.com>
Message-ID: <nycvar.YFH.7.76.1908051423440.5899@cbobk.fhfr.pm>
References: <20190805081212.3144-1-hdanton@sina.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 5 Aug 2019, Hillf Danton wrote:

> 1, no dev no open.
> 
> --- a/drivers/hid/usbhid/hiddev.c
> +++ b/drivers/hid/usbhid/hiddev.c
> @@ -284,6 +284,10 @@ static int hiddev_open(struct inode *ino
>  	spin_unlock_irq(&list->hiddev->list_lock);
>  
>  	mutex_lock(&hiddev->existancelock);
> +	if (!list->hiddev->exist) {
> +		res = -ENODEV;
> +		goto bail_unlock;
> +	}
>  	if (!list->hiddev->open++)
>  		if (list->hiddev->exist) {
>  			struct hid_device *hid = hiddev->hid;
> --
> 
> 2, list_del before vfree.
> 
> --- a/drivers/hid/usbhid/hiddev.c
> +++ b/drivers/hid/usbhid/hiddev.c
> @@ -300,6 +304,9 @@ bail_normal_power:
>  	hid_hw_power(hid, PM_HINT_NORMAL);
>  bail_unlock:
>  	mutex_unlock(&hiddev->existancelock);
> +	spin_lock_irq(&list->hiddev->list_lock);
> +	list_del(&list->node);
> +	spin_unlock_irq(&list->hiddev->list_lock);
>  bail:
>  	file->private_data = NULL;
>  	vfree(list);

Hilf,

both patches look good to me. Could you please resend them properly so 
that I could apply them? Thanks,

-- 
Jiri Kosina
SUSE Labs

