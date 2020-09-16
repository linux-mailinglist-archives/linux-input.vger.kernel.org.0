Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F234F26C87E
	for <lists+linux-input@lfdr.de>; Wed, 16 Sep 2020 20:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbgIPSvR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Sep 2020 14:51:17 -0400
Received: from 1.mo68.mail-out.ovh.net ([46.105.41.146]:34736 "EHLO
        1.mo68.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727923AbgIPSVK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Sep 2020 14:21:10 -0400
X-Greylist: delayed 3308 seconds by postgrey-1.27 at vger.kernel.org; Wed, 16 Sep 2020 14:21:09 EDT
Received: from player738.ha.ovh.net (unknown [10.110.115.143])
        by mo68.mail-out.ovh.net (Postfix) with ESMTP id 34EBF16800B
        for <linux-input@vger.kernel.org>; Wed, 16 Sep 2020 18:31:18 +0200 (CEST)
Received: from etezian.org (213-243-141-64.bb.dnainternet.fi [213.243.141.64])
        (Authenticated sender: andi@etezian.org)
        by player738.ha.ovh.net (Postfix) with ESMTPSA id 58AA51654073D;
        Wed, 16 Sep 2020 16:31:06 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-99G003434935c3-d5be-4bfb-9d38-1f2210c8509c,
                    E220774DB7FC1891A64BD699B7E3BDDD469A7482) smtp.auth=andi@etezian.org
Date:   Wed, 16 Sep 2020 19:31:05 +0300
From:   Andi Shyti <andi@etezian.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     dmitry.torokhov@gmail.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, andi@etezian.org, javier@osg.samsung.com,
        robh@kernel.org, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] Input: stmfts - Fix a & vs && typo
Message-ID: <20200916163105.GB50769@jack.zhora.eu>
References: <20200916141941.16684-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916141941.16684-1-yuehaibing@huawei.com>
X-Ovh-Tracer-Id: 4455748883065979445
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrtddvgddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughisegvthgviihirghnrdhorhhgqeenucggtffrrghtthgvrhhnpedtgfduudfhfeeuueejfeeihedtfeetgfegveehgfeuleelhfduteegieekudeifeenucfkpheptddrtddrtddrtddpvddufedrvdegfedrudeguddrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi YueHaibing,

On Wed, Sep 16, 2020 at 10:19:41PM +0800, YueHaibing wrote:
> In stmfts_sysfs_hover_enable_write(), we should check
> value and sdata->hover_enabled is all true.
> 
> Fixes: 78bcac7b2ae1 ("Input: add support for the STMicroelectronics FingerTip touchscreen")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Andi Shyti <andi@etezian.org>

Thanks,
Andi
