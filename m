Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B06862CE86
	for <lists+linux-input@lfdr.de>; Thu, 17 Nov 2022 00:11:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbiKPXKy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Nov 2022 18:10:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231564AbiKPXKx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Nov 2022 18:10:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B8F049B6F
        for <linux-input@vger.kernel.org>; Wed, 16 Nov 2022 15:10:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 111BEB81F27
        for <linux-input@vger.kernel.org>; Wed, 16 Nov 2022 23:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79720C433C1;
        Wed, 16 Nov 2022 23:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668640248;
        bh=cw0vpSXsvLiaE17Q/lLSKQQ6irpdjl6netgG5TVAyGw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=EWhSF3o4859PG95mYi8qNrbdbJG5q7KbggQ6HvztSAOqyXQxWkb6dVXxj+wcNTb0x
         3oDUHZ54DR00FRFtsWfXEgbRtk+F6fxQvucyGUdljAAbdZB2sdxzlfmxsQcBsYfJ9r
         ygMoLrU74a5xgk58Lq6r35tZ5Y4jeHJ1BWCvoFZHDUikNFnhs2x9L3nkpLu9jIIzEf
         Uz/lLCSAPPzaPfyVA6ljgVJFs+kt/w1aMUqPQrXNWnajqTNuTB7d6ocFi7Xs8HCV/n
         8ywViNLTmUjOtza82jKA1DsH4X+KLprw6221DPG+I4sDgC/jmPcRJC5VbGXcz4khBg
         WqICOSv9SOzeQ==
Date:   Thu, 17 Nov 2022 00:10:46 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Roderick Colenbrander <roderick@gaikai.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH 1/2] HID: playstation: fix DualShock4 bluetooth memory
 corruption bug.
In-Reply-To: <20221116160022.51829-1-roderick.colenbrander@sony.com>
Message-ID: <nycvar.YFH.7.76.2211170010120.6045@cbobk.fhfr.pm>
References: <20221116160022.51829-1-roderick.colenbrander@sony.com>
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

On Wed, 16 Nov 2022, Roderick Colenbrander wrote:

> The size of the output buffer used for output reports was not updated
> to the larger size needed for Bluetooth. This ultimately resulted
> in memory corruption of surrounding structures e.g. due to memsets.
> 
> Fixes: 2d77474a2392 ("HID: playstation: add DualShock4 bluetooth support.")
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>

Roderick,

thanks for the fixes. I believe

	Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

would be appropriate for this one, right?

-- 
Jiri Kosina
SUSE Labs

