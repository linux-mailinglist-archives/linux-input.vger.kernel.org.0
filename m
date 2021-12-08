Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96DB946D979
	for <lists+linux-input@lfdr.de>; Wed,  8 Dec 2021 18:16:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232640AbhLHRUP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Dec 2021 12:20:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234742AbhLHRUP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Dec 2021 12:20:15 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08438C061746
        for <linux-input@vger.kernel.org>; Wed,  8 Dec 2021 09:16:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 201B0CE2216
        for <linux-input@vger.kernel.org>; Wed,  8 Dec 2021 17:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89988C00446;
        Wed,  8 Dec 2021 17:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638983798;
        bh=//O/+tjSDvo3SX2PmjWmf/QrpGKIMFl4CJVq4mgxeRA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=FF/jNh+7bEws2/aqkKg+T2JDX31CUr6gmWJf6TQuyc3MY7765Nk974c/OH5TBSLxF
         wipsJ0fNjTWC1P94JSJl0E2q3tzlspW4cN2OpBQiL6tJUzA5EEjMgSKZWT3fyQViV1
         Jgef417ap+RaP07RsQszf9ilQgtMWX/H0idt6TxNW8OCv3Jmo9HEqacHJCUDYR7eZw
         tanKDJOD1sSvd1dFGtRjUbtZljrAH+1umVonXWQugLzINlUp6wifmgOOeXk43QIdh0
         QUmYtQOYPFYRSrpOmxiTFWJiURtAz1XQTEX+q4rRPF/wOI+i9IVH0Rb8czoILzArPJ
         KMTXcaV8er7LQ==
Date:   Wed, 8 Dec 2021 18:16:35 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: Ignore battery for Elan touchscreen on Asus
 UX550VE
In-Reply-To: <20211207121053.136906-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2112081816270.16505@cbobk.fhfr.pm>
References: <20211207121053.136906-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 7 Dec 2021, Hans de Goede wrote:

> Battery status is reported for the Asus UX550VE touchscreen even though
> it does not have a battery. Prevent it from always reporting the
> battery as low.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1897823
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thanks Hans.

-- 
Jiri Kosina
SUSE Labs

