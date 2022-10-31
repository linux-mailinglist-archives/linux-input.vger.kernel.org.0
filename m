Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC22C613D33
	for <lists+linux-input@lfdr.de>; Mon, 31 Oct 2022 19:19:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbiJaSTN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 31 Oct 2022 14:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbiJaSTM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 31 Oct 2022 14:19:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D070F65C6
        for <linux-input@vger.kernel.org>; Mon, 31 Oct 2022 11:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667240298;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tCXgHf9H3leaoQEtBaimVIYh137pWKTTSQFOhwtVCag=;
        b=IGDiO2H9G+nGQmckGqJ/aHucnw7azDCXClPhGpOA1Eg9r68GCIAUyzkym2e5pIiga9lKU3
        Pv+tfjtk2aVm2l4zQdZvUIEsSuIVQY5EoFqcJR7pELcOrxRxz42995/qAHyzpGshENZASO
        Fd8AKd+IvwYKNUYq3bmAnM7KLBZIf6g=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-277-Fk5cs8RnM860g23dxthzUA-1; Mon, 31 Oct 2022 14:18:14 -0400
X-MC-Unique: Fk5cs8RnM860g23dxthzUA-1
Received: by mail-ed1-f70.google.com with SMTP id y20-20020a056402271400b004630f3a32c3so3854698edd.15
        for <linux-input@vger.kernel.org>; Mon, 31 Oct 2022 11:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tCXgHf9H3leaoQEtBaimVIYh137pWKTTSQFOhwtVCag=;
        b=ja0dinCHP3xoQoQsa54mW9/poQdUwGsNyb0Be15S2I2YMdj20KDfkVZW1TyLgtHnwd
         1veclHLtXHv20tQqvA0oBrvevmm0UGsW3ilk4tVC/NvTliNHEaJqhJ6ftP75fnH6MuPX
         AmTEsA4LGSI7SV1S55xQz4BzXA6qhOJxpslt2wmMKLMQKo2gFIPCY1l6fS9yeBjxbAdZ
         wppCTlIjcz9X/Ir5vkjBaopej5dvvjcNqrNIlgrC8wRZxSb89dbWwjk1fpoL5cVNL4xv
         oAkUlsW0+O5A++CadP+tR9oI8KgHnVnKfndok4oL9ThaJz2F0SyiuWIxKawVfyQPpHF8
         Aipw==
X-Gm-Message-State: ACrzQf2pIiPmOm/iweegkmAJIX5gs3n9YvVOoMAvajbuO4JyWOcsx5H6
        dJOKZVInllzWoxfhFZcmsIAjSB/n//nkKVSmhWvezbAhORj83dM9rw1yHf0yw8AQxKGpIsXRAD5
        2uSbxdKuwhdCjWnhga3uDPv8=
X-Received: by 2002:a17:907:7faa:b0:7ad:e8e4:6ac7 with SMTP id qk42-20020a1709077faa00b007ade8e46ac7mr641348ejc.21.1667240292553;
        Mon, 31 Oct 2022 11:18:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5q7sSvjBaYyFk/xIkLjJGW3wYK5v00mlxja+vj93/4TKqB3gtSzWTjLsEGOMlMSzlHJwYjlQ==
X-Received: by 2002:a17:907:7faa:b0:7ad:e8e4:6ac7 with SMTP id qk42-20020a1709077faa00b007ade8e46ac7mr641333ejc.21.1667240292363;
        Mon, 31 Oct 2022 11:18:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ce24-20020a170906b25800b007a7f9b6318asm3277936ejb.50.2022.10.31.11.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 11:18:11 -0700 (PDT)
Message-ID: <9137979f-5d11-5050-0718-39e9fb0cb6f9@redhat.com>
Date:   Mon, 31 Oct 2022 19:18:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/4] Input: goodix - Try resetting the controller when no
 config is set
Content-Language: en-US, nl
To:     Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
References: <20221025122930.421377-1-hdegoede@redhat.com>
 <20221025122930.421377-2-hdegoede@redhat.com>
 <0ad614f5c69bae7bf7081b32660d41bf4edd906c.camel@hadess.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <0ad614f5c69bae7bf7081b32660d41bf4edd906c.camel@hadess.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/31/22 15:42, Bastien Nocera wrote:
> On Tue, 2022-10-25 at 14:29 +0200, Hans de Goede wrote:
>> On ACPI systems (irq_pin_access_method == IRQ_PIN_ACCESS_ACPI_*) the
>> driver
>> does not reset the controller at probe time, because sometimes the
>> system
>> firmware loads a config and resetting might loose this config.
> 
> "lose".
> 
> You can add
> Reviewed-by: Bastien Nocera <hadess@hadess.net>
> to all 4 patches in this patchset that don't already have it.

Thank you.

Dmitry, I assume you can fix the small spelling error in the
commit msg while applying this?

Regards,

Hans


