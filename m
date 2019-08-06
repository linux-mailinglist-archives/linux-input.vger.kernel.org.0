Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3C2182D3B
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2019 09:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728056AbfHFH5Z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Aug 2019 03:57:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:46624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727259AbfHFH5Y (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 6 Aug 2019 03:57:24 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF7D42070C;
        Tue,  6 Aug 2019 07:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565078243;
        bh=gaXWn3a5PPQz8dwbAIwHJkDL352IO94ThdBCOcn1nc0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=WlKFnxhAkYnSgF8qYscMlX4bKlKznAgyrxLnR8hGRjmdxSA07Ehfp1roEbYiOhkO/
         XKyKqHvuJIL5MeTjMXCxZa+4kkizesyl4+ja/XHUBLTrnXY8MW1QsaG8/lJgrAQ6QR
         y36K2vyPPehxIeyhTrBaxpf5AXUeL5/sPi4gu0nM=
Date:   Tue, 6 Aug 2019 09:57:10 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hillf Danton <hdanton@sina.com>
cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH 1/2] HID: hiddev: avoid opening a disconnected device
In-Reply-To: <20190806035820.10492-1-hdanton@sina.com>
Message-ID: <nycvar.YFH.7.76.1908060956460.27147@cbobk.fhfr.pm>
References: <20190806035820.10492-1-hdanton@sina.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 6 Aug 2019, Hillf Danton wrote:

> In order to avoid opening a disconnected device, we need to check exist
> again after acquiring the existance lock, and bail out if necessary.
> 
> Cc: Andrey Konovalov <andreyknvl@google.com>
> Signed-off-by: Hillf Danton <hdanton@sina.com>

Could you please add proper Reported-by: reference to syzbot? (in 2/2 as 
well).

Thanks,

-- 
Jiri Kosina
SUSE Labs

