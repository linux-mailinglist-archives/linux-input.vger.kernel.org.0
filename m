Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 986CF96339
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2019 16:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730002AbfHTO4E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Aug 2019 10:56:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:46436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729980AbfHTO4E (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Aug 2019 10:56:04 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D333122DA7;
        Tue, 20 Aug 2019 14:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566312963;
        bh=Qqfrzt5dcyq5vRFymiw4VbTMoZDLKcixhsTKSLZ9lFg=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=aRUT4QX4tuTBSZx5dLNdCPB0uHXAJ0OS5y+lgKGJwudGZ9OSMNaOEd2IsjspHHINy
         T1EvrPRM27y/E7W1VaLWcAlsyPhBLybGvayMTNDO7wWJ4nEQpy/antfQ6u/9Ihk0c/
         9vufxk/OUdIVzUUC2jeVxXCrXvVJViMo4qoKWeig=
Date:   Tue, 20 Aug 2019 16:55:53 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] HID: fix error message in hid_open_report()
In-Reply-To: <1230b0c19fd21fdc4d0eb30f3e32e67fff86fef9.1563818405.git.mirq-linux@rere.qmqm.pl>
Message-ID: <nycvar.YFH.7.76.1908201655030.27147@cbobk.fhfr.pm>
References: <1230b0c19fd21fdc4d0eb30f3e32e67fff86fef9.1563818405.git.mirq-linux@rere.qmqm.pl>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 22 Jul 2019, Michał Mirosław wrote:

> On HID report descriptor parsing error the code displays bogus
> pointer instead of error offset (subtracts start=NULL from end).
> Make the message more useful by displaying correct error offset
> and include total buffer size for reference.
> 
> This was carried over from ancient times - "Fixed" commit just
> promoted the message from DEBUG to ERROR.
> 
> Cc: stable@vger.kernel.org
> Fixes: 8c3d52fc393b ("HID: make parser more verbose about parsing errors by default")
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
[ ... snip ... ]
> @@ -1230,7 +1232,8 @@ int hid_open_report(struct hid_device *device)
>  		}
>  	}
>  
> -	hid_err(device, "item fetching failed at offset %d\n", (int)(end - start));
> +	hid_err(device, "item fetching failed at offset %zu/%zu\n",
> +		size - (end - start), size);

Hi Michal,

thanks for the fix.

This causes:

drivers/hid/hid-core.c: In function ‘hid_open_report’:
drivers/hid/hid-core.c:1235:2: warning: format ‘%zu’ expects argument of type ‘size_t’, but argument 4 has type ‘unsigned int’ [-Wformat=]
  hid_err(device, "item fetching failed at offset %zu/%zu\n",
  ^

could you please fix that up and resubmit?

Thanks,

-- 
Jiri Kosina
SUSE Labs

