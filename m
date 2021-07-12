Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CCFC3C5605
	for <lists+linux-input@lfdr.de>; Mon, 12 Jul 2021 12:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351027AbhGLINI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Jul 2021 04:13:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:37248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232200AbhGLILU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Jul 2021 04:11:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 160EF6192A;
        Mon, 12 Jul 2021 08:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626077305;
        bh=D5axI1QpdvyIYgpEcT9MGTrQcsKd2iXjRFMwgVwRytA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=QdSyplWQp0Pj/G1G6eLSGqJwuEIGWr4woRd7cO52TbJeQJPYmYAd2ASg7kRMvpKgV
         FCrWBE4wY8C7H4rchI1FE3D44HlHH8caFlUBcoju5HfWT4pvgvp8CF5AIXw3Hn6bzG
         Jq0AQbMxxaHQ+mWJ4T+0Dw9RIvJNC6vqXqQBTRZEL5C5VikojklH0xjlhVkfiFv7sf
         7mP6e7phY+PEAx+/fzVE7W+z1IvIJjGy242dQHJwJgborzH/nQygnayFdRi6rsxcQs
         IPuXvstr76R22jfgsEU06Mwk2Y7N/0Mo3TTt+uXnDso8EIHbVYFd1cohEjdyx3/wQM
         kNe7mMTIyvXUw==
Date:   Mon, 12 Jul 2021 10:08:14 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dylan MacKenzie <ecstaticmorse@gmail.com>
cc:     Basavaraj.Natikar@amd.com, Nehal-Bakulchandra.shah@amd.com,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        shyam-sundar.s-k@amd.com
Subject: Re: [PATCH 0/3] Add SFH sensor support for newer AMD platforms
In-Reply-To: <CAHpHHjbnhAnhkq-G1UbtjP=SB24FVnEtsXqkT8_ZTb7UD8j_kA@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2107121007410.8253@cbobk.fhfr.pm>
References: <CAHpHHjbnhAnhkq-G1UbtjP=SB24FVnEtsXqkT8_ZTb7UD8j_kA@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 26 Jun 2021, Dylan MacKenzie wrote:

> > Now queued in for-5.14/amd-sfh. Thanks,
> 
> FYI, this patch still uses the wrong register in `amd_sensor_stop_v2`.
> Basavaraj confirmed this, but my email client didn't CC the list for
> that conversation. Whoops!

Could you please send a followup patch on top of for-5.14/amd-sfh branch 
to fix that?

Thanks,

-- 
Jiri Kosina
SUSE Labs

