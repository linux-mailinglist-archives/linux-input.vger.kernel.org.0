Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0C61B76FF
	for <lists+linux-input@lfdr.de>; Fri, 24 Apr 2020 15:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbgDXNbX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Apr 2020 09:31:23 -0400
Received: from 8.mo177.mail-out.ovh.net ([46.105.61.98]:35452 "EHLO
        8.mo177.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726301AbgDXNbX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Apr 2020 09:31:23 -0400
X-Greylist: delayed 508 seconds by postgrey-1.27 at vger.kernel.org; Fri, 24 Apr 2020 09:31:22 EDT
Received: from player761.ha.ovh.net (unknown [10.110.171.125])
        by mo177.mail-out.ovh.net (Postfix) with ESMTP id 5445C12E600
        for <linux-input@vger.kernel.org>; Fri, 24 Apr 2020 15:22:53 +0200 (CEST)
Received: from etezian.org (213-243-141-64.bb.dnainternet.fi [213.243.141.64])
        (Authenticated sender: andi@etezian.org)
        by player761.ha.ovh.net (Postfix) with ESMTPSA id 14D3C11BAF160;
        Fri, 24 Apr 2020 13:22:44 +0000 (UTC)
Date:   Fri, 24 Apr 2020 16:22:43 +0300
From:   Andi Shyti <andi@etezian.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andi Shyti <andi@etezian.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: mms114 - add extra compatible for mms345l
Message-ID: <20200424132243.GH460760@jack.zhora.eu>
References: <20200423102431.2715-1-stephan@gerhold.net>
 <20200424092937.GB460760@jack.zhora.eu>
 <20200424113446.GA205913@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424113446.GA205913@gerhold.net>
X-Ovh-Tracer-Id: 16730028191111955181
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughisegvthgviihirghnrdhorhhgqeenucfkpheptddrtddrtddrtddpvddufedrvdegfedrudeguddrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeiuddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Stephan,

On Fri, Apr 24, 2020 at 01:34:46PM +0200, Stephan Gerhold wrote:
> On Fri, Apr 24, 2020 at 12:29:37PM +0300, Andi Shyti wrote:
> > Hi guys,
> > 
> > >  	}, {
> > >  		.compatible = "melfas,mms152",
> > >  		.data = (void *)TYPE_MMS152,
> > > +	}, {
> > > +		.compatible = "melfas,mms345l",
> > > +		.data = (void *)TYPE_MMS345L,
> > >  	},
> > 
> > it's been some times I haven't been doing this, but is the order
> > of the patches correct? shouldn't the binding be updated first?
> > 
> 
> Yes. I had it correct in my original patch, but apparently swapped the
> order accidentally for this one. I will do it correct again next time :)

then with that change:

Reviewed-by: Andi Shyti <andi@etezian.org>

Thanks,
Andi
