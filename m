Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEDC16522B9
	for <lists+linux-input@lfdr.de>; Tue, 20 Dec 2022 15:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234061AbiLTOgB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Dec 2022 09:36:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234060AbiLTOfc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Dec 2022 09:35:32 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC6BC193F7
        for <linux-input@vger.kernel.org>; Tue, 20 Dec 2022 06:35:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 89A8C61481
        for <linux-input@vger.kernel.org>; Tue, 20 Dec 2022 14:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FB1C433EF;
        Tue, 20 Dec 2022 14:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671546930;
        bh=l2TA5/sAPnAdsE+p94lgn6LNKii9KXwQ0pgvQYaS+Cw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=M+oTpmPtLMmuQRWWfkciDXiKv3fAKhh0FPzdvqOZIjOE96EeGN7KG+ccLR6RYU4pi
         N9tsHcewqxdMa5gG9vVBqjwIZApA4N30aHG2kIpw5FaqvBlAENxe5eAwS6YDYjXvIi
         E+6x8KOmMU6kjEvS6nqXmpgUsNUQLHYGFT0RIikojPnB7nmhfHBT6ycDNU4r0vISkz
         udgumu6cJexP2VaX4B3v8U/uzasHD3Bswhya3VT45Nt+kdJAP+qeRusPN77MYmu9If
         e4zmuQ93ToHZWHAkx9/lfPbepNAzIfJ0k2ZRLyYaz+dySLiOc00JeHqNRcgqgxVPev
         4vM/lrJU1CEqA==
Date:   Tue, 20 Dec 2022 15:35:30 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Terry Junge <linuxhid@cosmicgizmosystems.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: plantronics: Additional PIDs for double volume key
 presses quirk
In-Reply-To: <20221208230506.558000-1-linuxhid@cosmicgizmosystems.com>
Message-ID: <nycvar.YFH.7.76.2212201535220.9000@cbobk.fhfr.pm>
References: <20221208230506.558000-1-linuxhid@cosmicgizmosystems.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 8 Dec 2022, Terry Junge wrote:

> I no longer work for Plantronics (aka Poly, aka HP) and do not have
> access to the headsets in order to test. However, as noted by Maxim,
> the other 32xx models that share the same base code set as the 3220
> would need the same quirk. This patch adds the PIDs for the rest of
> the Blackwire 32XX product family that require the quirk.
> 
> Plantronics Blackwire 3210 Series (047f:c055)
> Plantronics Blackwire 3215 Series (047f:c057)
> Plantronics Blackwire 3225 Series (047f:c058)
> 
> Quote from previous patch by Maxim Mikityanskiy
> Plantronics Blackwire 3220 Series (047f:c056) sends HID reports twice
> for each volume key press. This patch adds a quirk to hid-plantronics
> for this product ID, which will ignore the second volume key press if
> it happens within 5 ms from the last one that was handled.
> 
> The patch was tested on the mentioned model only, it shouldn't affect
> other models, however, this quirk might be needed for them too.
> Auto-repeat (when a key is held pressed) is not affected, because the
> rate is about 3 times per second, which is far less frequent than once
> in 5 ms.
> End quote
> 
> Signed-off-by: Terry Junge <linuxhid@cosmicgizmosystems.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

