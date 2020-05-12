Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31CD31CF178
	for <lists+linux-input@lfdr.de>; Tue, 12 May 2020 11:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728990AbgELJWB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 05:22:01 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33148 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727783AbgELJWB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 05:22:01 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id E913C2A18F5
Subject: Re: [PATCH 1/6] tty/sysrq: Remove linux,sysrq-reset-seq
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, kernel@collabora.com
References: <20200511135918.8203-1-andrzej.p@collabora.com>
 <20200511135918.8203-2-andrzej.p@collabora.com>
 <20200511175812.GT89269@dtor-ws>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <0922f55d-f1a9-e312-8205-b324217e936e@collabora.com>
Date:   Tue, 12 May 2020 11:21:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200511175812.GT89269@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

W dniu 11.05.2020 o 19:58, Dmitry Torokhov pisze:
> Hi Andrzej,
> 
> On Mon, May 11, 2020 at 03:59:13PM +0200, Andrzej Pietrasiewicz wrote:
>> Nobody in the tree uses linux,sysrq-reset-seq in Device Tree source files.
>> Remove the corresponding code.
> 
> Unlike platform data, we do not require or even expect that all DT users
> be present in mainline, so absence if references to a feature in kernel
> can not serve as justification for removal. Consider the fact that we
> support DT-style binding in ACPI (which is BIOS/firmware).
> 
> That said, I am not against removing this support, but we need to make
> sure that Android (where this came from) does not use this anymore.

How can I do it? Can I at all?

Andrzej

