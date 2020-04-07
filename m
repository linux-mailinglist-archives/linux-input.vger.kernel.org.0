Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 112FC1A17C5
	for <lists+linux-input@lfdr.de>; Wed,  8 Apr 2020 00:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgDGWIw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Apr 2020 18:08:52 -0400
Received: from 11.mo1.mail-out.ovh.net ([188.165.48.29]:33148 "EHLO
        11.mo1.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbgDGWIv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Apr 2020 18:08:51 -0400
X-Greylist: delayed 1016 seconds by postgrey-1.27 at vger.kernel.org; Tue, 07 Apr 2020 18:08:50 EDT
Received: from player692.ha.ovh.net (unknown [10.108.57.226])
        by mo1.mail-out.ovh.net (Postfix) with ESMTP id 60E0D1B9FA3
        for <linux-input@vger.kernel.org>; Tue,  7 Apr 2020 23:51:53 +0200 (CEST)
Received: from etezian.org (213-243-141-64.bb.dnainternet.fi [213.243.141.64])
        (Authenticated sender: andi@etezian.org)
        by player692.ha.ovh.net (Postfix) with ESMTPSA id CADFA1114F23A;
        Tue,  7 Apr 2020 21:51:44 +0000 (UTC)
Date:   Wed, 8 Apr 2020 00:51:43 +0300
From:   Andi Shyti <andi@etezian.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi@etezian.org>, linux-input@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: mms114: document melfas,mms345l
 binding
Message-ID: <20200407215143.GD207210@jack.zhora.eu>
References: <20200405170904.61512-1-stephan@gerhold.net>
 <20200405170904.61512-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200405170904.61512-2-stephan@gerhold.net>
X-Ovh-Tracer-Id: 17724197810407588589
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudeigddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughisegvthgviihirghnrdhorhhgqeenucfkpheptddrtddrtddrtddpvddufedrvdegfedrudeguddrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieelvddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Stephan,

On Sun, Apr 05, 2020 at 07:09:04PM +0200, Stephan Gerhold wrote:
> The mms114 driver now supports MMS345L; document the
> melfas,mms345l binding that is used for it.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Andi Shyti <andi@etezian.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

just one nitpick, the signing should be sorted in chronological
order, I see that you reverted it.

You first signed it as the author, then I reviewed it and the Rob
acked it, so that it should be:

  Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
  Reviewed-by: Andi Shyti <andi@etezian.org>
  Acked-by: Rob Herring <robh@kernel.org>

you reversed it.

Other than that, I'm sorry I couldn't help you but I haven't
received answers from Samsung about getting the prototypes.
However I don't see reason for not applying the patch.

Andi
