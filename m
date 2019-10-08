Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE1DCF8F5
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2019 13:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730618AbfJHLyL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Oct 2019 07:54:11 -0400
Received: from 10.mo3.mail-out.ovh.net ([87.98.165.232]:41703 "EHLO
        10.mo3.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730835AbfJHLyL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Oct 2019 07:54:11 -0400
X-Greylist: delayed 594 seconds by postgrey-1.27 at vger.kernel.org; Tue, 08 Oct 2019 07:54:10 EDT
Received: from player688.ha.ovh.net (unknown [10.108.42.168])
        by mo3.mail-out.ovh.net (Postfix) with ESMTP id 50DC0227BF9
        for <linux-input@vger.kernel.org>; Tue,  8 Oct 2019 13:44:15 +0200 (CEST)
Received: from etezian.org (85-76-98-218-nat.elisa-mobile.fi [85.76.98.218])
        (Authenticated sender: andi@etezian.org)
        by player688.ha.ovh.net (Postfix) with ESMTPSA id CF780AA08234;
        Tue,  8 Oct 2019 11:44:04 +0000 (UTC)
Date:   Tue, 8 Oct 2019 14:44:03 +0300
From:   Andi Shyti <andi@etezian.org>
To:     Andi Shyti <andi@etezian.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Simon Shields <simon@lineageos.org>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Input: mms114 - add support for mms345l
Message-ID: <20191008114403.GB4015@jack.zhora.eu>
References: <20191007203343.101466-1-stephan@gerhold.net>
 <20191007205021.104402-1-stephan@gerhold.net>
 <20191008113511.GA4015@jack.zhora.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008113511.GA4015@jack.zhora.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Ovh-Tracer-Id: 8543047019269243586
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -85
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrheelgdeghecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogetfedtuddqtdduucdludehmd
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> > -	if (!i2c_check_functionality(client->adapter,
> > -				I2C_FUNC_PROTOCOL_MANGLING)) {
> > +	type = (enum mms_type)device_get_match_data(&client->dev);
> 
> you don't need any cast here.

sorry, please ignore :)

Andi
