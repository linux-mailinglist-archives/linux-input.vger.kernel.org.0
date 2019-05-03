Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF0C12DD9
	for <lists+linux-input@lfdr.de>; Fri,  3 May 2019 14:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727570AbfECMmW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 May 2019 08:42:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:45362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727032AbfECMmW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 3 May 2019 08:42:22 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7A9E22075E;
        Fri,  3 May 2019 12:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556887341;
        bh=82WGJLwfu51418WgW0AMMuUlO3hHLGELfWELisFxIxw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=UdkY7xlws5JZVWfKukbn+3hW5DuBkAZEvlsnuiKzpgIUkWY3m56S7kLQQ0p2GNrw3
         iifrXECZLeAcnyXXLJOUiptlqAUyPR0x6wxpfUCspkoZnrk4eERExuvkFnnuvxZFCT
         lKczVouw6DS6yuSwWMifO6vnKtasIJ2Fjfpwe1iQ=
Date:   Fri, 3 May 2019 14:42:18 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Fabien DESSENNE <fabien.dessenne@st.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: rmi: fix devm_add_action_or_reset() parameter
In-Reply-To: <9628edde-5270-d5a5-7db6-c9ec3f47c742@st.com>
Message-ID: <nycvar.YFH.7.76.1905031440570.10635@cbobk.fhfr.pm>
References: <1555073657-24386-1-git-send-email-fabien.dessenne@st.com> <nycvar.YFH.7.76.1905031418510.10635@cbobk.fhfr.pm> <9628edde-5270-d5a5-7db6-c9ec3f47c742@st.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 3 May 2019, Fabien DESSENNE wrote:

> >> -	ret = devm_add_action_or_reset(&hdev->dev, &rmi_irq_teardown, hdata);
> >> +	ret = devm_add_action_or_reset(&hdev->dev, rmi_irq_teardown, hdata);
> > Why do you think this is wrong C?
> 
> Because I was not aware that both func and &func refer to the same 
> function pointer.
> 
> Now I know :)

Yup, it's defined in 6.3.2.1.4 in C99.

-- 
Jiri Kosina
SUSE Labs

