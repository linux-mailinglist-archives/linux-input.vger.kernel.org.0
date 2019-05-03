Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25DE412D5F
	for <lists+linux-input@lfdr.de>; Fri,  3 May 2019 14:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727413AbfECMTX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 May 2019 08:19:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:35922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727089AbfECMTX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 3 May 2019 08:19:23 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 07F4E2075C;
        Fri,  3 May 2019 12:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556885962;
        bh=cEX9eZzIJ7SzIZ7UNG6VMMIRHh7FseRM82nHBzD6nfc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=XaW3UnuphvPDapv7n3OZeeE++M89ozjremuUhZ6ibqX0KkLs5jCzs+rTwqGwEd+oF
         0aWClNRMl7K67DPnVP1uYfsztpp4Yml8cP0QkiBfDI7Csfnr6Iurs2ID1f6ZjO6lvN
         Lb6Ht7U8UmgbFdxEUNnU7PYeRo+yJ8Ao3a2diDD8=
Date:   Fri, 3 May 2019 14:19:19 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Fabien Dessenne <fabien.dessenne@st.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: rmi: fix devm_add_action_or_reset() parameter
In-Reply-To: <1555073657-24386-1-git-send-email-fabien.dessenne@st.com>
Message-ID: <nycvar.YFH.7.76.1905031418510.10635@cbobk.fhfr.pm>
References: <1555073657-24386-1-git-send-email-fabien.dessenne@st.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 12 Apr 2019, Fabien Dessenne wrote:

> The second parameter of devm_add_action_or_reset() shall be a function,
> not a function address.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  drivers/hid/hid-rmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
> index 9e33165..8748d4d 100644
> --- a/drivers/hid/hid-rmi.c
> +++ b/drivers/hid/hid-rmi.c
> @@ -623,7 +623,7 @@ static int rmi_setup_irq_domain(struct hid_device *hdev)
>  	if (!hdata->domain)
>  		return -ENOMEM;
>  
> -	ret = devm_add_action_or_reset(&hdev->dev, &rmi_irq_teardown, hdata);
> +	ret = devm_add_action_or_reset(&hdev->dev, rmi_irq_teardown, hdata);

Why do you think this is wrong C?

-- 
Jiri Kosina
SUSE Labs

