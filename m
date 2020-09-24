Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10333277452
	for <lists+linux-input@lfdr.de>; Thu, 24 Sep 2020 16:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbgIXOxA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Sep 2020 10:53:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:35500 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727859AbgIXOxA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Sep 2020 10:53:00 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6130B2074B;
        Thu, 24 Sep 2020 14:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600959180;
        bh=x/UiVkDrbxTj+emBP7iWoafHZgoeH3lVYV0w1Grnozk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=xvdoTTUs/U1QUBxcAL5QGbrhHPi82TsZ7OxBNfd+QGwBHFIIGl4zfoZiUK6iFtNAW
         pfcvPyvN6rkGIdhSo55fqYXKZamE8Nlvum/IBvbNJRiOcvaa6jeLs1LX/j545+CUfO
         ONdghCRuVX8Lj/ApfYIgW7BQXKHulP33KV4HDI3E=
Date:   Thu, 24 Sep 2020 16:52:56 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Vincent Huang <vincent.huang@tw.synaptics.com>
cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Lyude Paul <lyude@redhat.com>,
        Chris Heiny <chris.heiny@synaptics.com>
Subject: Re: [PATCH 2/3] HID: rmi - rename f30_data to gpio_data
In-Reply-To: <20200924094628.1085000-3-vincent.huang@tw.synaptics.com>
Message-ID: <nycvar.YFH.7.76.2009241652270.3336@cbobk.fhfr.pm>
References: <20200924094628.1085000-1-vincent.huang@tw.synaptics.com> <20200924094628.1085000-3-vincent.huang@tw.synaptics.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 24 Sep 2020, Vincent Huang wrote:

> f30_data in rmi_device_platform_data could be also referenced by RMI
> function 3A, so rename it and the structure name to avoid confusion.
> 
> Signed-off-by: Vincent Huang <vincent.huang@tw.synaptics.com>
> ---
>  drivers/hid/hid-rmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
> index 9ce22acdfaca..62315e31d520 100644
> --- a/drivers/hid/hid-rmi.c
> +++ b/drivers/hid/hid-rmi.c
> @@ -722,7 +722,7 @@ static int rmi_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	}
>  
>  	if (data->device_flags & RMI_DEVICE_HAS_PHYS_BUTTONS)
> -		rmi_hid_pdata.f30_data.disable = true;
> +		rmi_hid_pdata.gpio_data.disable = true;
>  
>  	data->xport.dev = hdev->dev.parent;
>  	data->xport.pdata = rmi_hid_pdata;

Please fold this into the first patch; this way you break bisectability.

Thanks,

-- 
Jiri Kosina
SUSE Labs

