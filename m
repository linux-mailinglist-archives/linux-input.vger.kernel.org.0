Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 172B8209D06
	for <lists+linux-input@lfdr.de>; Thu, 25 Jun 2020 12:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404002AbgFYKq5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jun 2020 06:46:57 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35432 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403997AbgFYKq5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jun 2020 06:46:57 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id EE3D42A422E
Subject: Re: [PATCH v7] dt-bindings: mfd: Convert ChromeOS EC bindings to
 json-schema
To:     Lee Jones <lee.jones@linaro.org>, Ikjoon Jang <ikjn@chromium.org>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Gwendal Grignou <gwendal@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nicolas Boitchat <drinkcat@chromium.org>,
        linux-input@vger.kernel.org
References: <20200306085513.76024-1-ikjn@chromium.org>
 <20200417101333.GA3737@dell>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <ab5adcd1-18f2-9b1c-8c5d-744f7a0e5579@collabora.com>
Date:   Thu, 25 Jun 2020 12:46:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200417101333.GA3737@dell>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Lee,

On 17/4/20 12:13, Lee Jones wrote:
> On Fri, 06 Mar 2020, Ikjoon Jang wrote:
> 
>> Convert the ChromeOS EC bindings to json-schema.
>>
>> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
>> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> ---
>>  .../devicetree/bindings/mfd/cros-ec.txt       |  76 -----------
>>  .../bindings/mfd/google,cros-ec.yaml          | 129 ++++++++++++++++++
>>  2 files changed, 129 insertions(+), 76 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.txt
>>  create mode 100644 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> 
> Applied, thanks.
> 

I don't see this patch applied, I am missing something?

Thanks,
 Enric
