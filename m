Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9C8D1758D2
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 12:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgCBLAX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 06:00:23 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:54471 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgCBLAX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 06:00:23 -0500
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8AC94200016;
        Mon,  2 Mar 2020 11:00:18 +0000 (UTC)
Message-ID: <8897a0f0f44ccc2060bf5ea627cb4a6e8242d730.camel@hadess.net>
Subject: Re: [PATCH v1 2/2] Input: goodix - support gt9147 touchpanel
From:   Bastien Nocera <hadess@hadess.net>
To:     Yannick Fertre <yannick.fertre@st.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 02 Mar 2020 12:00:17 +0100
In-Reply-To: <1583144308-3781-3-git-send-email-yannick.fertre@st.com>
References: <1583144308-3781-1-git-send-email-yannick.fertre@st.com>
         <1583144308-3781-3-git-send-email-yannick.fertre@st.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.35.91 (3.35.91-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2020-03-02 at 11:18 +0100, Yannick Fertre wrote:
> Add support for it by adding compatible and supported chip data
> (default settings used).
> The chip data on GT9147 is similar to GT912, like
> - config data register has 0x8047 address
> - config data register max len is 240
> - config data checksum has 8-bit
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@st.com>


Both patches:
Reviewed-by: Bastien Nocera <hadess@hadess.net>

But you'll likely need to send another update on top of the "Add
support for Goodix GT917S touch controller" patchset, which makes some
changes to goodix_get_chip_data().

