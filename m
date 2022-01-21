Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F11C4961DF
	for <lists+linux-input@lfdr.de>; Fri, 21 Jan 2022 16:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351281AbiAUPQo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jan 2022 10:16:44 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:50946 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351244AbiAUPQm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jan 2022 10:16:42 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 89C2A61913
        for <linux-input@vger.kernel.org>; Fri, 21 Jan 2022 15:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A27C340E1;
        Fri, 21 Jan 2022 15:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642778201;
        bh=5qWEvcmx1Nmszwc4A9wJ9+18AAtJZEQU3f8jyB3111Y=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=pWojXCBPVAg/S70d4tPDgkodi7LxowcSuo5CK52zcCRRZSjkr6ISkoxi/rkYFcTXb
         st/1a2Cq0Pj6JsrWi21YUA9TL8LHOhcCod21VzHfNmYcPu3EhQ2QYp9iE2Ub+NWvQZ
         dZD3H648cg8UnIHGhcV4EAv8ojJ9dHBGZz22ppd/pfiDHtHE9+z+HOCe50CfQnMPco
         1HpxjHtJIlH50fh7NjGDWxu1wNAV2YKcvjx5obfbmnWDsgoAHuLxfmH1WfifJZrxYO
         DQDDxmlDbBxpNVV/Glr+X/BLhgfWTdS//NNv0Jku+PWFy2QDWIqBvOX2WPTI6A+FYM
         4lxUFNSNwIelA==
Date:   Fri, 21 Jan 2022 16:16:38 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Alex Henrie <alexhenrie24@gmail.com>
cc:     linux-input@vger.kernel.org,
        Markus Wageringel <markus.wageringel@gmail.com>
Subject: Re: [PATCH] HID: apple: Set the tilde quirk flag on the Wellspring
 5 and later
In-Reply-To: <20220116230158.29596-1-alexhenrie24@gmail.com>
Message-ID: <nycvar.YFH.7.76.2201211616290.28059@cbobk.fhfr.pm>
References: <20220116230158.29596-1-alexhenrie24@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 16 Jan 2022, Alex Henrie wrote:

> Markus reports that his 2011 MacBook with a German ISO keyboard (USB
> product code 05ac:0246, HID country code 13) has the tilde key quirk.
> Seeing as all of the standalone Apple ISO keyboards since about 2008
> have the quirk, it seems reasonable to assume that once the integrated
> laptop keyboards started having the quirk, they likewise never stopped
> having it.
> 
> Reported-by: Markus Wageringel <markus.wageringel@gmail.com>
> Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs

