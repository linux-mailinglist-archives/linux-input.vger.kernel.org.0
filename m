Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73AA741F1E
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2019 10:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405127AbfFLIbt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jun 2019 04:31:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:44186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726977AbfFLIbt (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 04:31:49 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 922372063F;
        Wed, 12 Jun 2019 08:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560328308;
        bh=Nq++LcIxkkRLUUveMOekwCDCNrrxtqs5QNqOj2/Eaxk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=ZzCpPVPYQ9k68Z+7UQpcmHTAKvMMTNgZehswif77EhJ6eCnPfUBupYY47r080bm52
         wf4LSYPdClCHYX5dPgaCShsQ3p4uUiNC9oiccn3XzEAhAyrSAYIZljJo7++ovljym+
         hnDOQGkMsDiJqDGNdFs1p9N77DPhf158pLDivqHU=
Date:   Wed, 12 Jun 2019 10:31:45 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
cc:     Hans de Goede <hdegoede@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing <linux-kernel@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: Strange regression in hid_llogitech_dj (was: Re: Linux
 5.2-rc4)
In-Reply-To: <1875376.0DUQQ8o03D@kreacher>
Message-ID: <nycvar.YFH.7.76.1906121029350.27227@cbobk.fhfr.pm>
References: <CAHk-=wjm7FQxdF=RKa8Xe23CLNNpbGDOACewgo8e-hwDJ8TyQg@mail.gmail.com> <2268131.Lc39eCoc3j@kreacher> <nycvar.YFH.7.76.1906112358580.27227@cbobk.fhfr.pm> <1875376.0DUQQ8o03D@kreacher>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 12 Jun 2019, Rafael J. Wysocki wrote:

> It kind of helps, but there is a catch.
> 
> hid-logitech-dj is not loaded after a fresh boot, so I need to modprobe it manually and that
> appears to be blocking (apparently indefinitely) until terminated with ^C.  But then it turns
> out that hid-logitech-dj is there in the list of modules and it is in use (by usbhid) and the
> mouse works.

My bad, I should've asked you to test with the complete 'for-5.2/fixes' 
branch which contains two reverts [1] [2] that should fix this issue as 
well.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=for-5.2/fixes&id=e0b7f9bc0246bc642d1de2ff3ff133730584c956
[2] https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=for-5.2/fixes&id=f9482dabfd1686987cc6044e06ae0e4c05915518

-- 
Jiri Kosina
SUSE Labs

