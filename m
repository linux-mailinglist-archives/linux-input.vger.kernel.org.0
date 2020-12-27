Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18FAC2E2F73
	for <lists+linux-input@lfdr.de>; Sun, 27 Dec 2020 01:09:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725979AbgL0AI5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 26 Dec 2020 19:08:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbgL0AI4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 26 Dec 2020 19:08:56 -0500
Received: from lithium.sammserver.com (lithium.sammserver.com [IPv6:2a01:4f8:c2c:b7df::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A24C061757
        for <linux-input@vger.kernel.org>; Sat, 26 Dec 2020 16:08:16 -0800 (PST)
Received: from mail.sammserver.com (sammserver.wg [10.32.40.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by lithium.sammserver.com (Postfix) with ESMTPS id B3BB731181DE;
        Sun, 27 Dec 2020 01:08:14 +0100 (CET)
Received: from fastboi.localdomain (fastboi.wg [10.32.40.5])
        by mail.sammserver.com (Postfix) with ESMTP id 074873E877;
        Sun, 27 Dec 2020 01:08:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sammserver.com;
        s=email; t=1609027694;
        bh=iosfYJE3hEf+cAscU8U4sF3R+SNtQCMHjz67hAvsrv4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iXLlKmuDc4AS6ZASt8zlIU114WE/Cyvzre/WkphHIP47QwE39hrHSAeQr6DMuAreh
         N2oNQqqwgfl8OGaYrZjapgImoCY495GLLsSLtxflmgPhmnsnPdXGWnSZW/KmxiNOJN
         BAp6z9r0EWVsEwmXcpRlBnKNXJvgNbG4izByv1pA=
Received: by fastboi.localdomain (Postfix, from userid 1000)
        id E7E3E1420814; Sun, 27 Dec 2020 01:08:13 +0100 (CET)
Date:   Sun, 27 Dec 2020 01:08:13 +0100
From:   Samuel =?utf-8?B?xIxhdm9q?= <sammko@sammserver.com>
To:     Roderick Colenbrander <roderick@gaikai.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH 12/13] HID: playstation: DualSense set LEDs to default
 player id.
Message-ID: <20201227000813.axo7h2tsaa4eqqbr@fastboi.localdomain>
References: <20201219062336.72568-1-roderick@gaikai.com>
 <20201219062336.72568-13-roderick@gaikai.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201219062336.72568-13-roderick@gaikai.com>
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on sammserver.tu
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Roderick,

this one is very much just a nitpick, yet not completely pointless.

On 18.12.2020 22:23, Roderick Colenbrander wrote:
> @@ -837,8 +859,8 @@ static void dualsense_output_worker(struct work_struct *work)
>  	}
>  
>  	if (ds->update_player_leds) {
> -		r->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE;
> -		r->player_leds = ds->player_leds_state;
> +		common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE;
> +		common->player_leds = ds->player_leds_state;

This change should be merged into the previous patch, as it doesn't
compile without it (typo, I suppose). Could lead to annoyment during
git bisect and all that.

Regards,
Samuel
