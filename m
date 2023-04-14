Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F15D6E255A
	for <lists+linux-input@lfdr.de>; Fri, 14 Apr 2023 16:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbjDNOMj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Apr 2023 10:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbjDNOMi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Apr 2023 10:12:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E39FCB745
        for <linux-input@vger.kernel.org>; Fri, 14 Apr 2023 07:12:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 32F796069B
        for <linux-input@vger.kernel.org>; Fri, 14 Apr 2023 14:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7EFFC433D2;
        Fri, 14 Apr 2023 14:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681481425;
        bh=0QKH+Gl8bGfeTGhyG2DwMHe0L+MzSHt154QzG1CeDzw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=R8hdcODC1e7n2Pte8wYbxM4HJ7kAjp6fUV2lWBHPZvgfKgEHd1hQu6xejcxb7NqSs
         z/xGC+587D3foohQisXSPR+B9ic8UVzaVXyw1pYxZVygGtaWZ/VhWrKxu/zheH/wFi
         0TBHQIJiDPkqOpg1ik6AOodNJ2Mfk/fNFOfQvldnla9K9M8aEhq16FIKkiqTpCa0VV
         Ob48pLdY7e7PSXe70AaB4VCQlz21joUmQ+HVAEO2OWMA5FoG1N0QG5xO5yCkd8cSkI
         hhT8RK1GWxGQDMClwSUFRfDJDEjZhwLjHAxFWV6KKbzrFLG9NgI7n9zQWn7JUjbxxv
         8s7g+bWjkVoFg==
Date:   Fri, 14 Apr 2023 16:10:21 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Jason Gerecke <killertofu@gmail.com>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Joshua Dickens <Joshua@Joshua-Dickens.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH 1/2] HID: wacom: Lazy-init batteries
In-Reply-To: <20230413181743.7849-1-jason.gerecke@wacom.com>
Message-ID: <nycvar.YFH.7.76.2304141610040.29760@cbobk.fhfr.pm>
References: <20230413181743.7849-1-jason.gerecke@wacom.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 13 Apr 2023, Jason Gerecke wrote:

> From: Jason Gerecke <killertofu@gmail.com>
> 
> Rather than creating batteries as part of the initial device probe, let's
> make the process lazy. This gives us the opportunity to prevent batteries
> from being created in situations where they are unnecessary.
> 
> There are two cases in particular where batteries are being unnecessarily
> created at initialization. These are AES sensors (for which we don't know
> any battery status information until a battery-powered pen actually comes
> into prox) peripheral tablets which share HID descriptors between the
> wired-only and wireless-capable SKUs of a family of devices.
> 
> This patch will delay battery initialization of the former until a pen
> actually comes into prox. It will delay battery initialization of the
> latter until either a pen comes into prox or a "heartbeat" packet is
> processed.
> 
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> Tested-by: Mario Limonciello <mario.limonciello@amd.com>

I have added the Link: tags suggested by Mario and applied, thanks.

-- 
Jiri Kosina
SUSE Labs

