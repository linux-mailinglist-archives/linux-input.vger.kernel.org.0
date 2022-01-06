Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2592C4864A5
	for <lists+linux-input@lfdr.de>; Thu,  6 Jan 2022 13:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239082AbiAFM5f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Jan 2022 07:57:35 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:58620 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239070AbiAFM5f (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Jan 2022 07:57:35 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DC89F61BBA
        for <linux-input@vger.kernel.org>; Thu,  6 Jan 2022 12:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F9AC36AE5;
        Thu,  6 Jan 2022 12:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641473854;
        bh=mwRHjECVZ5NrFvu9evJt74iVpptWS/4ddCz6M4f4Xqs=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Ws260u53cY5GtVTeJxjytOuCyHDa/o/SS63Vd+t0LQyhatgA/nx3VDzLRrpZcgcOX
         44SM6SF19CzP3PsWyucmsFKfzgWpWXn415KEpvQuTFgwk2NQMO4EseNTcw2yguh2Xj
         9AYwim/mQDu+nnXjUSjP41GDmpe/0a1SOwiDR4v7f8XTRwRaXQxBXcoHEmAnzTmJCs
         JNYoMCRWOZYC6eH1e4AIbI0Z76VG+X0/6gBa73JUBr0zsKxAY5xpOBEvsZ0tyRbJ5W
         PmzrpQkBusVHNaENzcF1Y+yQCpOxClhsicQ1SYXYmo6gZze3IQc8YKlZOSfE8hMXHR
         bogAuPxkpyLjA==
Date:   Thu, 6 Jan 2022 13:57:30 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
cc:     alexhenrie24@gmail.com, bberg@redhat.com,
        benjamin@sipsolutions.net, linux-input@vger.kernel.org
Subject: Re: [PATCH 2/2] HID: apple: Add 2021 Magic Keyboard with number
 pad
In-Reply-To: <20220102172045.164534-1-jose.exposito89@gmail.com>
Message-ID: <nycvar.YFH.7.76.2201061357250.16505@cbobk.fhfr.pm>
References: <20211202061651.115548-2-alexhenrie24@gmail.com> <20220102172045.164534-1-jose.exposito89@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 2 Jan 2022, José Expósito wrote:

> Hi!
> 
> Thanks a lot for the patches Alex.
> 
> I tested them on the following hardware:
> 
>  - Magic Keyboard 2021 without fingerprint reader. ANSI, ISO and JIS.
>  - Magic Keyboard 2021 with fingerprint reader. ANSI.
>  - Magic Keyboard 2021 with fingerprint reader and numpad. ANSI
> 
> Code looks good as well.
> 
> Tested-by: José Expósito <jose.exposito89@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

