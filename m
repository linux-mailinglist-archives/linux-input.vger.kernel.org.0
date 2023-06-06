Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA20723C2D
	for <lists+linux-input@lfdr.de>; Tue,  6 Jun 2023 10:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237254AbjFFIuy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jun 2023 04:50:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231977AbjFFIux (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Jun 2023 04:50:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06CA8197
        for <linux-input@vger.kernel.org>; Tue,  6 Jun 2023 01:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686041408;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cEKrV5Ld6c5X6gTrzyzGWaWRap8Na3txP7EpTR/xTbE=;
        b=eYvahoK7q3JiL7qwowCY7a3ys3TKdpTjEWbjQN/OQVagNZBDiwbehudYdSHoXrhfAEL4ML
        XBZUoJAKNijQrnQhg37bH1Bof9JQlfDKYfgUuinA4D8aOz/sCiOJhsWGz1/mpSa0sL0e0d
        1YqOFCoBVfZ1WyhsO5U3BKajctdN8ag=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-JW1Iv0tNOeOOp8encjhKkg-1; Tue, 06 Jun 2023 04:50:06 -0400
X-MC-Unique: JW1Iv0tNOeOOp8encjhKkg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7819D185A7A5;
        Tue,  6 Jun 2023 08:50:05 +0000 (UTC)
Received: from mail.corp.redhat.com (unknown [10.45.224.77])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 12A0D40CFD16;
        Tue,  6 Jun 2023 08:50:03 +0000 (UTC)
Date:   Tue, 6 Jun 2023 10:50:01 +0200
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] HID: fix an error code in hid_check_device_match()
Message-ID: <5l3iorkq32xvn6cf4zgropma4j2peant2vwqbmpwmu3g3n2d2t@f5el5yhz7uwg>
References: <ZH7sZv4PEovkMxNP@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZH7sZv4PEovkMxNP@moroto>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On Jun 06 2023, Dan Carpenter wrote:
> 
> The hid_check_device_match() returns true if we find a match and false
> if we don't.  But here it returns -ENODEV which becomes true instead
> of false.
> 
> Fixes: 207733f92661 ("HID: split apart hid_device_probe to make logic more apparent")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/hid/hid-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index 4b7062dcefec..8992e3c1e769 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -2593,7 +2593,7 @@ static bool hid_check_device_match(struct hid_device *hdev,
>  {
>  	*id = hid_match_device(hdev, hdrv);
>  	if (!*id)
> -		return -ENODEV;
> +		return false;

Thanks for spotting this!

Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin

>  
>  	if (hdrv->match)
>  		return hdrv->match(hdev, hid_ignore_special_drivers);
> -- 
> 2.30.2
> 

