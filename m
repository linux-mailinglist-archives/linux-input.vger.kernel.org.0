Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C10615B49B
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2020 00:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729095AbgBLXXK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 18:23:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:33280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727117AbgBLXXK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 18:23:10 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4FB3020848;
        Wed, 12 Feb 2020 23:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581549789;
        bh=TvICLvO9Snk4i7FuNgUQI0ItU+qw1IAxuj3QcAxRPM0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=1gdDaDj409R0nHzjEurNMPfxA0HIjFQdV+yJnpk9xhebX21Rx1UiXKxEDc0lZqi4R
         7+1eZWfMS8M9vBOcMx4DAEKhSVkx1q5kdu0u9N22Exka94D4KVIaHMfuCFLsmmNB64
         Xfm3fIbHaB3L3ljZcdTMkLViqSHmkjXd9GLNaAhE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0101016eee224b83-b0577d24-8f51-4e1a-9afb-b3f518e5ba77-000000@us-west-2.amazonses.com>
References: <20191205002503.13088-1-masneyb@onstation.org> <20191205002503.13088-2-masneyb@onstation.org> <0101016eee224b83-b0577d24-8f51-4e1a-9afb-b3f518e5ba77-000000@us-west-2.amazonses.com>
Subject: Re: [PATCH 1/7] clk: qcom: add support for setting the duty cycle
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mark.rutland@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
To:     Brian Masney <masneyb@onstation.org>,
        Taniya Das <tdas@codeaurora.org>, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org
Date:   Wed, 12 Feb 2020 15:23:08 -0800
Message-ID: <158154978850.184098.12366153456613977692@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Taniya Das (2019-12-09 20:47:35)
> Hi Brian,
>=20
> On 12/5/2019 5:54 AM, Brian Masney wrote:
> > +     d_reg_val =3D mask - (((mask - 17) * duty->num) / duty->den);
> > +     ret =3D __clk_rcg2_configure_with_duty_cycle(rcg, rcg->freq_tbl,
> > +                                                d_reg_val, duty->num,
> > +                                                duty->den);
>=20
> The duty-cycle calculation is not accurate.
> There is already a plan to submit the duty-cycle changes from my side.

What are the plans to submit this? Should we expect to see this support
in the next week? Month?
