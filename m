Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5FE4E41C2
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2019 04:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390793AbfJYCsV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Oct 2019 22:48:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:53854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728416AbfJYCsV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Oct 2019 22:48:21 -0400
Received: from dragon (li937-157.members.linode.com [45.56.119.157])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 663E921D71;
        Fri, 25 Oct 2019 02:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571971701;
        bh=ZufLCq4V0xFP53T+ZSuvvs4DDZ9uy2hKtlxRIlrCtgA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=x+lvlFOR8A8xFLNoxbyn19gtg10Cno7Sd7gCdZ4bo1lWKnqluSeVPL3n6rzRKYC8Z
         1i1AZ9ed0ajQniTFQtF8ehYuFGY89x+W3kzYgJPnRnOF2n721vyNr8BsqCia3IUCRi
         DQOCUU6Hc7DZAwoGkbjZUVRK6ox2dDPgYJH/Mb0w=
Date:   Fri, 25 Oct 2019 10:48:05 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 5/5] ARM: dts: imx6dl-yapp4: Enable the MPR121
 touchkey controller on Hydra
Message-ID: <20191025024804.GC30015@dragon>
References: <1570083176-8231-1-git-send-email-michal.vokac@ysoft.com>
 <1570083176-8231-6-git-send-email-michal.vokac@ysoft.com>
 <390ce745-4768-8e61-de03-fde74517fad5@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <390ce745-4768-8e61-de03-fde74517fad5@ysoft.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 16, 2019 at 08:07:22AM +0200, Michal Vokáč wrote:
> On 03. 10. 19 8:12, Michal Vokáč wrote:
> >Add the touch keyboard present on Hydra board. The controller
> >is connected only using I2C lines. The interrupt line is not
> >available hence we use the polling mode.
> >
> >Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> >---
> 
> This should ideally go through the input tree with the rest of
> the changes that add support for the poll-interval.

Not really necessary.  The patches can reach linux-next and mainline
through different trees, as long as there is no hard dependency which
could break build or cause regression on any of the trees.

Applied to imx/dt branch.

Shawn
