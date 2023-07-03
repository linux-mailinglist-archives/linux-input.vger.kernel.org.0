Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDA7A745743
	for <lists+linux-input@lfdr.de>; Mon,  3 Jul 2023 10:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjGCIXu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Jul 2023 04:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjGCIXt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 Jul 2023 04:23:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D10B2
        for <linux-input@vger.kernel.org>; Mon,  3 Jul 2023 01:23:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6ED6060DD0
        for <linux-input@vger.kernel.org>; Mon,  3 Jul 2023 08:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CC42C433C7;
        Mon,  3 Jul 2023 08:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688372627;
        bh=Hdohe6w/v/jIyUErl///SqdhGfp5HdoQhMJXLxBfcdY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bPIoDGLOJF03a7ACL7Jxh3JpaE6NWtX0l5KE30RjoijSqLWmrt7DAufeEGgyuEogu
         x9QNg6aDdC0UQ53/BjwDXaG1zlCmPgCwioynGsF5sSttp9d68i9MwFZp20mvXkd1Vr
         DdEyuy/9n0FPq/A1yhPCJDV6KhiQczGg7uQAeFD1DMBkyQggSqyyRRSa3nUprOi0nP
         BJpCCAnE8JZdJ1GlK4sS2detgiUe4gzd+SlBJ5dH4QOPjJ20DoUQfMCGPZuTQUHTI0
         9nfjpCREQ/8o4TB6qX2eTFoRAyY6BO99dJTFsd4wRAGCGPSbjUkmzqiszdE2U+Vuv6
         e4AbSwHPTToGQ==
Date:   Mon, 3 Jul 2023 10:23:43 +0200
From:   Benjamin Tissoires <bentiss@kernel.org>
To:     "Limonciello, Mario" <mario.limonciello@amd.com>
Cc:     Friedrich Vock <friedrich.vock@gmx.de>,
        linux-input@vger.kernel.org,
        "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] HID: i2c-hid: Block a rogue device on ASUS TUF A16
Message-ID: <hqddkr2cqzzwxkse6tlfusm6ww4ijmeh34rwij56njlzxdmpu3@cmq5h36ia2bf>
References: <20230530154058.17594-1-friedrich.vock@gmx.de>
 <dc4da9cf-a66f-6e09-165d-f16a405f2a38@amd.com>
 <7b2ec797-2fdd-9707-7f53-d0a24ed036fc@gmx.de>
 <b067c9a1-cc07-2781-9a9d-71488ec3ddba@amd.com>
 <491ec8a8-efc7-7995-ac82-03a5431f66bd@amd.com>
 <0a9ba51e-0b07-cd9d-32fa-d99596c34183@gmx.de>
 <9c10f6f2-b145-db5e-ebed-981222a72be7@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c10f6f2-b145-db5e-ebed-981222a72be7@amd.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On Jun 30 2023, Limonciello, Mario wrote:
[...]
> 
> Friderich and some people on CC are already aware of this, but mostly for
> Benjamin and Jiri I wanted to let you know that the additional register
> fetching comparing Windows and Linux allowed me to come up with a proper
> root cause.
> 
> This series has been sent out to fix the issue properly.

Great, thanks for the heads up :)

Cheers,
Benjamin


> 
> https://lore.kernel.org/linux-gpio/20230630194716.6497-1-mario.limonciello@amd.com/
