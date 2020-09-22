Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D616273F12
	for <lists+linux-input@lfdr.de>; Tue, 22 Sep 2020 11:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgIVJ72 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Sep 2020 05:59:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:47060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726353AbgIVJ71 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Sep 2020 05:59:27 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 63DDB2388B;
        Tue, 22 Sep 2020 09:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600768767;
        bh=N3eSb6tFG2JA1+ia7D37JtNSaVT+szMuO1tsrhO1840=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=GslNNUh/+C7hKUhIYoO1wkLfBSnLTGq+jwofj9mk5x6vmq8se9G7suiePfLL8DYbg
         7ivz67PjJ2qL+nJ3TdGldfc36ZR33SdI1B5WfX7Ta9+JkcWOoR88bH8VPPLh8Agd15
         2VhvzwkbCOHQu/lOgQ0j+QbZQOEWjI8h+dCo6zII=
Date:   Tue, 22 Sep 2020 11:59:24 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Mikael_Wikstr=F6m?= <leakim.wikstrom@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] HID: multitouch: Lenovo X1 Tablet Gen3 trackpoint
 and buttons
In-Reply-To: <20200922094810.3669-1-leakim.wikstrom@gmail.com>
Message-ID: <nycvar.YFH.7.76.2009221159170.3336@cbobk.fhfr.pm>
References: <20200922094810.3669-1-leakim.wikstrom@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 22 Sep 2020, Mikael Wikström wrote:

> One more device that needs 40d5bb87 to resolve regression for the trackpoint
> and three mouse buttons on the type cover of the Lenovo X1 Tablet Gen3.
> 
> It is probably also needed for the Lenovo X1 Tablet Gen2 with PID 0x60a3
> 
> Signed-off-by: Mikael Wikström <leakim.wikstrom@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

