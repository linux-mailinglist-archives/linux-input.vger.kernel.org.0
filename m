Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCDE6429B6
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2019 16:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732013AbfFLOpR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jun 2019 10:45:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:56274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728707AbfFLOpR (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 10:45:17 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 68106206BB;
        Wed, 12 Jun 2019 14:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560350716;
        bh=rOfk/K0YNJACpRZFi4bgdJVwMwRzfJQ4/d8AReyG3XA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Pd4/F0yMyORxjiIL4Q4GYK4bTFMq+FmycjXpaW2xU09+SKqP8l8EhnTowlUEUqmpe
         /LjeLKkSzfjukeQSjtcEFq6BQ7Oj3e7Ew0jQ0ghrFM6j5iZYmuOevsE3fTXNFfv0TV
         S081STik3qZaMDk/o1QVHvduaR9OgmnDsec2VeDE=
Date:   Wed, 12 Jun 2019 16:45:11 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        benjamin.tissoires@redhat.com, bjorn.andersson@linaro.org,
        lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        agross@kernel.org, david.brown@linaro.org, hdegoede@redhat.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] HID: quirks: Refactor ELAN 400 and 401 handling
In-Reply-To: <20190612003507.GG143729@dtor-ws>
Message-ID: <nycvar.YFH.7.76.1906121644160.27227@cbobk.fhfr.pm>
References: <20190606161055.47089-1-jeffrey.l.hugo@gmail.com> <20190606161322.47192-1-jeffrey.l.hugo@gmail.com> <20190612003507.GG143729@dtor-ws>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 11 Jun 2019, Dmitry Torokhov wrote:

> > +static const char *hid_elan_i2c_ignore[] = {
> 
> If this is a copy of elan whitelist, then, if we do not want to bother
> with sharing it in object form (as a elan-i2c-ids module), can we at
> least move it into include/linux/input/elan-i2c-ids.h and consume from
> hid-quirks.c?

Let's just not duplicate it in both objects. Why not properly export it 
from hid_quirks?

Thanks,

-- 
Jiri Kosina
SUSE Labs

