Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2A0151D186
	for <lists+linux-input@lfdr.de>; Fri,  6 May 2022 08:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239242AbiEFGk7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 May 2022 02:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232774AbiEFGk5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 May 2022 02:40:57 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75C9766205
        for <linux-input@vger.kernel.org>; Thu,  5 May 2022 23:37:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id B37E8CE33FB
        for <linux-input@vger.kernel.org>; Fri,  6 May 2022 06:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293D0C385A8;
        Fri,  6 May 2022 06:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651819032;
        bh=SQRnx9yTXz6Kxa3FZPo0VuYOueuSdpmeh2WlTLYA/Cw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=gg4wlSEpbVpRedw4s7YBHDXvT8tMWjvoIExpgBqgA/4baGnmzO1ccoCSHrHPdpadX
         B1w33tSD6cb4Ljhq6ZWE5qv4HhgatCYYmH2haKbp8LHiY3lfMgu6DyNPSCjiVenUIG
         jV3FtYLajNwA2wOAG7Gubx/lC6ffS7Q5Bir71AwsgKa+D8gvrWJE1nlW1Hkvgl7yhs
         b1pGJIEGTiWJHDirm1jONq80wcW4PYQte9vLcTE3M9/pD/M87w2KvPIas5b2zk2aBs
         ImlF+RI2yu9SCams7W5K4JOd2RDCAiXomdkvX3CDV3fjY9bT9bBAYdX6FrHed5U9X/
         sonCvvd8MVMiQ==
Date:   Fri, 6 May 2022 08:37:07 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Joshua Dickens <joshua@joshua-dickens.com>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Jason Gerecke <killertofu@gmail.com>,
        kernel test robot <lkp@intel.com>,
        Joshua Dickens <joshua.dickens@wacom.com>
Subject: Re: [PATCH] Hid: wacom: Fix kernel test robot warning
In-Reply-To: <20220430000134.608043-1-Joshua@Joshua-Dickens.com>
Message-ID: <nycvar.YFH.7.76.2205060836510.28985@cbobk.fhfr.pm>
References: <20220430000134.608043-1-Joshua@Joshua-Dickens.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 29 Apr 2022, Joshua Dickens wrote:

> From: Joshua-Dickens <Joshua@Joshua-Dickens.com>
> 
> Kernel test robot throws the following warning -
> >> drivers/hid/wacom_wac.c:2411:42: warning: format specifies type 'unsigned short' but the argument has type 'int' [-Wformat]
>                            hid_warn(hdev, "Dropped %hu packets", value - wacom_wac->hid_data.sequence_number);
>                                                    ~~~           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>                                                    %d
> 
> Explicitly casting the argument to unsigned short to silence the warning and retain the intended behavior.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Joshua Dickens <joshua.dickens@wacom.com>
> ---
>  drivers/hid/wacom_wac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index 64fe573deb9b..9470c2b0b529 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -2408,7 +2408,7 @@ static void wacom_wac_pen_event(struct hid_device *hdev, struct hid_field *field
>  		return;
>  	case WACOM_HID_WD_SEQUENCENUMBER:
>  		if (wacom_wac->hid_data.sequence_number != value)
> -			hid_warn(hdev, "Dropped %hu packets", value - wacom_wac->hid_data.sequence_number);
> +			hid_warn(hdev, "Dropped %hu packets", (unsigned short)(value - wacom_wac->hid_data.sequence_number));
>  		wacom_wac->hid_data.sequence_number = value + 1;
>  		return;

Applied on top of the pile in for-5.19/wacom, thanks Joshua.

-- 
Jiri Kosina
SUSE Labs

