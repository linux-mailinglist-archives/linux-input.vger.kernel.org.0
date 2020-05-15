Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B197B1D5A7E
	for <lists+linux-input@lfdr.de>; Fri, 15 May 2020 22:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgEOUA5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 May 2020 16:00:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:52344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726226AbgEOUA5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 May 2020 16:00:57 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7CE6E20727;
        Fri, 15 May 2020 20:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589572857;
        bh=e4X2hu0tzluzxhD81apSEnQovQ+dE4ivGX8ynORov9I=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Jq+niRT/7kQus5tGZH6FCj7pK3bWwGobMApHw0ikmNw2P/A79TwK3w6jMJVLlj4JR
         a9Mj6QpvIISKrtG59UjN2tmv3PGymHARN2Wko3D1/NEv7FjiMjp3/tYnt4JBsxzNsa
         B/Lnzkh5BvyhyIW3nSRtcxI6/jDBNmnWQueYrRIk=
Date:   Fri, 15 May 2020 22:00:54 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Cristian Klein <cristian.klein@elastisys.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Subject: Re: [PATCH] Add quirks for Trust Panora Graphic Tablet
In-Reply-To: <20200508152604.21143-1-cristian.klein@elastisys.com>
Message-ID: <nycvar.YFH.7.76.2005152200440.25812@cbobk.fhfr.pm>
References: <20200508152604.21143-1-cristian.klein@elastisys.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 8 May 2020, Cristian Klein wrote:

> The Trust Panora Graphic Tablet has two interfaces. Interface zero
> reports pen movement, pen pressure and pen buttons. Interface one
> reports tablet buttons and tablet scroll. Both use the mouse protocol.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

