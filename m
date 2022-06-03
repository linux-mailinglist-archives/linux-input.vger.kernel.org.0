Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD70853C755
	for <lists+linux-input@lfdr.de>; Fri,  3 Jun 2022 11:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242981AbiFCJUF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Jun 2022 05:20:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234089AbiFCJUF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Jun 2022 05:20:05 -0400
X-Greylist: delayed 126314 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 03 Jun 2022 02:20:02 PDT
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE1939BB6;
        Fri,  3 Jun 2022 02:20:01 -0700 (PDT)
Received: (Authenticated sender: contact@artur-rojek.eu)
        by mail.gandi.net (Postfix) with ESMTPA id B7172200005;
        Fri,  3 Jun 2022 09:19:58 +0000 (UTC)
MIME-Version: 1.0
Date:   Fri, 03 Jun 2022 11:19:58 +0200
From:   Artur Rojek <contact@artur-rojek.eu>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Chris Morgan <macromorgan@hotmail.com>,
        Chris Morgan <macroalpha82@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        maccraft123mc@gmail.com
Subject: Re: [PATCH v2 1/3] dt-bindings: adc-joystick: add adc-joystick,polled
 option
In-Reply-To: <67f56e57-185a-1e4b-e20b-4f7772a10580@linaro.org>
References: <20220601204927.10256-1-macroalpha82@gmail.com>
 <20220601204927.10256-2-macroalpha82@gmail.com>
 <12a65f1d-4f3a-417f-3c90-5461870abe2a@linaro.org>
 <SN6PR06MB5342F372D3810B8EDA15BB99A5DE9@SN6PR06MB5342.namprd06.prod.outlook.com>
 <67f56e57-185a-1e4b-e20b-4f7772a10580@linaro.org>
Message-ID: <60d467244a9dc1c7cc29d0035d536e2a@artur-rojek.eu>
X-Sender: contact@artur-rojek.eu
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2022-06-03 07:33, Krzysztof Kozlowski wrote:
> On 02/06/2022 21:44, Chris Morgan wrote:
>> On Thu, Jun 02, 2022 at 11:56:10AM +0200, Krzysztof Kozlowski wrote:
>>> On 01/06/2022 22:49, Chris Morgan wrote:
>>>> From: Chris Morgan <macromorgan@hotmail.com>
>>>> 
>>>> Add documentation for adc-joystick,polled. New device-tree 
>>>> properties
>>>> have been added.
>>>> 
>>>> - adc-joystick,polled: A boolean value noting the joystick device
>>>> 		       should be polled rather than use a triggered
>>>> 		       buffer.
>>>> 
>>>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>>> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>>>> ---
>>>>  .../devicetree/bindings/input/adc-joystick.yaml          | 9 
>>>> ++++++++-
>>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>> 
>>>> diff --git 
>>>> a/Documentation/devicetree/bindings/input/adc-joystick.yaml 
>>>> b/Documentation/devicetree/bindings/input/adc-joystick.yaml
>>>> index 2ee04e03bc22..4f49a1a5772e 100644
>>>> --- a/Documentation/devicetree/bindings/input/adc-joystick.yaml
>>>> +++ b/Documentation/devicetree/bindings/input/adc-joystick.yaml
>>>> @@ -12,12 +12,19 @@ maintainers:
>>>> 
>>>>  description: >
>>>>    Bindings for joystick devices connected to ADC controllers 
>>>> supporting
>>>> -  the Industrial I/O subsystem.
>>>> +  the Industrial I/O subsystem. Supports both polled devices where 
>>>> no
>>>> +  iio trigger is available and non-polled devices which are 
>>>> triggered
>>>> +  by iio.
>>>> 
>>>>  properties:
>>>>    compatible:
>>>>      const: adc-joystick
>>>> 
>>>> +  adc-joystick,polled:
>>>> +    type: boolean
>>>> +    description:
>>>> +      If the device does not support triggered buffers and needs to 
>>>> be polled.
>>> 
>> 
>> What would your recommendation be? I'm basically proposing polling
>> instead of utilizing a triggered buffer, so instead of the driver
>> relying on a hardware trigger or a software trigger being set up to
>> fill the buffer that is read by the input subsystem we use the input
>> subsystem polling function directly (this is useful for my use-case
>> where the Rockchip SARADC doesn't have a hardware trigger).
> 
> Then it could be: "adc-joystik,no-hardware-trigger". The description is
> I think accurate, so just the property name.

Hmm... I don't think DT involvement is necessary here, as this 
information can be derived from iio at runtime:
`if (iio_dev->modes & INDIO_BUFFER_SOFTWARE)` - a buffer can be used,
`if (iio_dev->modes & INDIO_DIRECT_MODE)` - device can be polled.

Cheers,
Artur
> 
> 
> 
> Best regards,
> Krzysztof
