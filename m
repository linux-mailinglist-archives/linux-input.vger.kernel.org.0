Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7883ECFD86
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2019 17:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbfJHPYD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Oct 2019 11:24:03 -0400
Received: from 9.mo178.mail-out.ovh.net ([46.105.75.45]:42313 "EHLO
        9.mo178.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbfJHPYC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Oct 2019 11:24:02 -0400
X-Greylist: delayed 8399 seconds by postgrey-1.27 at vger.kernel.org; Tue, 08 Oct 2019 11:24:02 EDT
Received: from player779.ha.ovh.net (unknown [10.109.143.246])
        by mo178.mail-out.ovh.net (Postfix) with ESMTP id 08F8679D8F
        for <linux-input@vger.kernel.org>; Tue,  8 Oct 2019 13:44:38 +0200 (CEST)
Received: from etezian.org (85-76-98-218-nat.elisa-mobile.fi [85.76.98.218])
        (Authenticated sender: andi@etezian.org)
        by player779.ha.ovh.net (Postfix) with ESMTPSA id 46727A99DC68;
        Tue,  8 Oct 2019 11:44:27 +0000 (UTC)
Date:   Tue, 8 Oct 2019 14:44:26 +0300
From:   Andi Shyti <andi@etezian.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi@etezian.org>,
        Andi Shyti <andi.shyti@samsung.com>,
        Simon Shields <simon@lineageos.org>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] Input: mms114 - use device_get_match_data
Message-ID: <20191008114426.GC4015@jack.zhora.eu>
References: <20191007203343.101466-1-stephan@gerhold.net>
 <20191007203343.101466-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007203343.101466-2-stephan@gerhold.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Ovh-Tracer-Id: 8549520944366338797
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrheelgdeghecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Stephan,

> device_get_match_data is available now, so we can replace the call
> to of_device_get_match_data and remove the FIXME comment.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Reviewed-by: Andi Shyti <andi@etezian.org>

Thanks,
Andi
