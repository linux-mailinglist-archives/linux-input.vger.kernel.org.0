Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCE217E576
	for <lists+linux-input@lfdr.de>; Mon,  9 Mar 2020 18:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727229AbgCIRNE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Mar 2020 13:13:04 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:57049 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727198AbgCIRNE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Mar 2020 13:13:04 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 353EEE000A;
        Mon,  9 Mar 2020 17:13:01 +0000 (UTC)
Message-ID: <fa64548fdf75e2440df6ab66490460329e43017b.camel@hadess.net>
Subject: Re: [PATCH v3 09/11] Input: goodix - Add minimum firmware size check
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Date:   Mon, 09 Mar 2020 18:13:01 +0100
In-Reply-To: <20200307121505.3707-9-hdegoede@redhat.com>
References: <20200307121505.3707-1-hdegoede@redhat.com>
         <20200307121505.3707-9-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.35.92 (3.35.92-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 2020-03-07 at 13:15 +0100, Hans de Goede wrote:
> Our goodix_check_cfg_* helpers do things like:
> 
> 	int i, raw_cfg_len = cfg->size - 2;
> 	...
> 	if (check_sum != cfg->data[raw_cfg_len]) {
> 
> When cfg->size < 2, this will end up indexing the cfg->data array
> with
> a negative value, which will not end well.
> 
> To fix this this commit adds a new GOODIX_CONFIG_MIN_LENGTH define
> and
> adds a minimum size check for firmware-config files using this new
> define.
> 
> For consistency this commit also adds a new GOODIX_CONFIG_GT9X_LENGTH
> for
> the length used for recent gt9xx and gt1xxx chips, instead of using
> GOODIX_CONFIG_MAX_LENGTH for this, so that if other length defines
> get
> added in the future it will be clear that the MIN and MAX defines
> should
> contain the min and max values of all the other defines.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Bastien Nocera <hadess@hadess.net>

