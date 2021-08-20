Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2A03F2C74
	for <lists+linux-input@lfdr.de>; Fri, 20 Aug 2021 14:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237828AbhHTMvf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Aug 2021 08:51:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:40144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231685AbhHTMvf (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Aug 2021 08:51:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CEB4460187;
        Fri, 20 Aug 2021 12:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629463857;
        bh=aAtcJJqVawLbZdPSJij5oVeaN+x5/EoaK/wcOgW9tbQ=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=qRtsTDlXlAyc6dSLjgH6kKjJD2SG4VMs/0t4xRy1BWbooilpqjWUWOodt7qy+MfeX
         gWsjfCn9txxRuSrbQpkli9xH7mr4URMXC3TnGiOR36u6Pc7JCejDIVZLZ/l6NAVYsn
         fy0w4yoMEAyx350o80NOI3I83kxbApOW8aaHagWnkAy2k4FFHXZjMF90hldpio/MDN
         MgYHQ9k2mvmyUVDdviy2fSZK2M5MxJ73MSo1Et/e/DDvqcfmT2kPUAPQaEWCTKWQff
         Nvya56cftSW5tQy1pSHGkNzbVqGuPYZA2Ppag0ODhaibqOY7eMBY3vA/snZ77JIICS
         9AEBU+XjyFZOg==
Date:   Fri, 20 Aug 2021 14:50:54 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     "Luke D. Jones" <luke@ljones.dev>
cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com
Subject: Re: [PATCH] HID: asus: Prevent Claymore sending suspend event
In-Reply-To: <20210807024921.26479-1-luke@ljones.dev>
Message-ID: <nycvar.YFH.7.76.2108201450460.15313@cbobk.fhfr.pm>
References: <20210807024921.26479-1-luke@ljones.dev>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 7 Aug 2021, Luke D. Jones wrote:

> Prevent the ASUS Claymore keyboard from sending a suspend event
> when the device sleeps itself. The suspend event causes a system
> suspend if uncaught.

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs

