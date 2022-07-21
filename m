Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF4D57C86C
	for <lists+linux-input@lfdr.de>; Thu, 21 Jul 2022 12:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232318AbiGUKAa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jul 2022 06:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233030AbiGUKAP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jul 2022 06:00:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2112595A8
        for <linux-input@vger.kernel.org>; Thu, 21 Jul 2022 03:00:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AFAFAB821EB
        for <linux-input@vger.kernel.org>; Thu, 21 Jul 2022 10:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E629C3411E;
        Thu, 21 Jul 2022 10:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658397609;
        bh=Li3mmxM18jEyEJPe5efPttu/1k79+0h0qz+GM2lWKE0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=IyxL+GG1ZRN4ZBYRLd1zqHk1hBrSJqHudCSb8hbGNSKuS/63sN5dF6omE5LKWqEnf
         oiD6yuDygMLbErXY23SMTEsgBrZw0urm5wlub6z1RDVw80B5iLRvMU+Tt/64Si2pIY
         PTdkcfAfVN4e56k5da52wmRZSft5QSRPdqOEJUhtQXSvM2M+Q0wlK1e97XJkvcgMEN
         vSAm8RJ9aIxHdlCVyu5b915Jf1YWnZEBXs0iDbhJzjfSv+X8CS3aCnXLpURABuRiWf
         RVokz9secG7Z3dlzVEZbsYwCOjlV8wx5Hk+PU57dXAII+Bzmi3ncuLhW8kJuC8nsxL
         EcL5ltStACbDQ==
Date:   Thu, 21 Jul 2022 12:00:05 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hyunwoo Kim <imv4bel@gmail.com>
cc:     erazor_de@users.sourceforge.net, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: roccat: Fix Use-After-Free in roccat_read
In-Reply-To: <20220626111330.GA59219@ubuntu>
Message-ID: <nycvar.YFH.7.76.2207211159210.19850@cbobk.fhfr.pm>
References: <20220626111330.GA59219@ubuntu>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 26 Jun 2022, Hyunwoo Kim wrote:

> diff --git a/drivers/hid/hid-roccat.c b/drivers/hid/hid-roccat.c
> index 26373b82fe81..abe23ccd48e8 100644
> --- a/drivers/hid/hid-roccat.c
> +++ b/drivers/hid/hid-roccat.c
> @@ -260,7 +260,9 @@ int roccat_report_event(int minor, u8 const *data)
>  	report = &device->cbuf[device->cbuf_end];
>  
>  	/* passing NULL is safe */
> +	mutex_lock(&device->cbuf_lock);
>  	kfree(report->value);
> +	mutex_unlock(&device->cbuf_lock);
>  
>  	report->value = new_value;
>  	device->cbuf_end = (device->cbuf_end + 1) % ROCCAT_CBUF_SIZE;

Don't we actually need the mutex for much longer period during 
roccat_report_event()? At minimum it's also manipulating cbuf_end.

Thanks,

-- 
Jiri Kosina
SUSE Labs

