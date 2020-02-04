Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B755151673
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2020 08:26:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgBDH0c (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Feb 2020 02:26:32 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33986 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbgBDH0c (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Feb 2020 02:26:32 -0500
Received: from [IPv6:2a02:810a:113f:ad1c:9d02:317c:3fd7:2872] (unknown [IPv6:2a02:810a:113f:ad1c:9d02:317c:3fd7:2872])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E85A528F776;
        Tue,  4 Feb 2020 07:26:28 +0000 (GMT)
Subject: Re: [PATCH v2] dt-bindings: convert cros-ec-keyb.txt to yaml
To:     Rob Herring <robh@kernel.org>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        mark.rutland@arm.com, bleung@chromium.org,
        enric.balletbo@collabora.com, groeck@chromium.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com
References: <20200124104158.5008-1-dafna.hirschfeld@collabora.com>
 <20200203123539.GA26961@bogus>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <de29c5a3-3ee7-0c2c-e288-c25c30fdfadf@collabora.com>
Date:   Tue, 4 Feb 2020 08:26:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200203123539.GA26961@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 03.02.20 13:35, Rob Herring wrote:
> On Fri, Jan 24, 2020 at 11:41:58AM +0100, Dafna Hirschfeld wrote:
>> Convert the binding file cros-ec-keyb.txt to yaml format.
>>
>> This was tested and verified on ARM and ARM64 with:
>>
>> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/input/cros-ec-keyb.yaml
>> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/input/cros-ec-keyb.yaml
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>> Changes from v1:
>> add: "additionalProperties: false"
>>
>>   .../bindings/input/cros-ec-keyb.txt           |  72 ------------
>>   .../bindings/input/cros-ec-keyb.yaml          | 107 ++++++++++++++++++
>>   2 files changed, 107 insertions(+), 72 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/input/cros-ec-keyb.txt
>>   create mode 100644 Documentation/devicetree/bindings/input/cros-ec-keyb.yaml
> 
> [...]
> 
>> diff --git a/Documentation/devicetree/bindings/input/cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/cros-ec-keyb.yaml
>> new file mode 100644
>> index 000000000000..d414a2ad7c69
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/cros-ec-keyb.yaml
>> @@ -0,0 +1,107 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/input/cros-ec-keyb.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: ChromeOS EC Keyboard
>> +
>> +maintainers:
>> +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> +  - Rob Herring <robh+dt@kernel.org>
> 
> Again, should be a Google/Cros person (I'm assuming Dmitry is here as
> input maintainer).
> 
>> +
>> +description: |
>> +  Google's ChromeOS EC Keyboard is a simple matrix keyboard implemented on
>> +  a separate EC (Embedded Controller) device. It provides a message for reading
>> +  key scans from the EC. These are then converted into keycodes for processing
>> +  by the kernel. This binding is based on matrix-keymap.txt and extends it.
>> +
>> +properties:
>> +  compatible:
>> +    const: google,cros-ec-keyb
>> +
>> +  google,needs-ghost-filter:
>> +    type: boolean
>> +    description: |
>> +      True to enable a ghost filter for the matrix keyboard.
>> +      This is recommended if the EC does not have its own logic or
>> +      hardware for this.
>> +
>> +  # properties from matrix-keymap.txt
>> +  linux,keymap:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    description: |
>> +      an array of packed 1-cell entries containing the equivalent
>> +      of row, column and linux key-code. The 32-bit big endian cell is packed
>> +      as:
>> +      row << 24 | column << 16 | key-code
>> +
>> +  keypad,num-rows:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: Number of row lines connected to the keypad controller.
>> +
>> +  keypad,num-columns:
>> +    $ref: /schemas/types.yaml#/definitions/uint32It seems that column and row are actually uint8 because of the definition for a cell: `row << 24 | column << 16 | key-code`
so I can change the ref lines to `$ref: /schemas/types.yaml#/definitions/uint8`

>> +    description: Number of column lines connected to the keypad controller.
> 
> matrix-keypad.txt should be converted to yaml and then referenced here.
> 
There is no "matrix-keypad.txt" did you mean "matrix-keymap.txt" ?
I see that matrix-keymap.txt is mentioned in 14 files so this will require also
changing all those files.
  

> Unless you have max sizes, then there's not any more to add here.
In include/linux/input/matrix_keypad.h there are the defines
MATRIX_MAX_COLS, MATRIX_MAX_ROWS as 32.
which seems to be the max values

thanks,
Dafna

> 
>> +
>> +required:
>> +  - compatible
>> +  - linux,keymap
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    cros-ec-keyb {
>> +        compatible = "google,cros-ec-keyb";
>> +        keypad,num-rows = <8>;
>> +        keypad,num-columns = <13>;
>> +        google,needs-ghost-filter;
>> +        /*
>> +         * Keymap entries take the form of 0xRRCCKKKK where
>> +         * RR=Row CC=Column KKKK=Key Code
>> +         * The values below are for a US keyboard layout and
>> +         * are taken from the Linux driver. Note that the
>> +         * 102ND key is not used for US keyboards.
>> +         */
>> +        linux,keymap = <
>> +                /* CAPSLCK F1         B          F10     */
>> +                0x0001003a 0x0002003b 0x00030030 0x00040044
>> +                /* N       =          R_ALT      ESC     */
>> +                0x00060031 0x0008000d 0x000a0064 0x01010001
>> +                /* F4      G          F7         H       */
>> +                0x0102003e 0x01030022 0x01040041 0x01060023
>> +                /* '       F9         BKSPACE    L_CTRL  */
>> +                0x01080028 0x01090043 0x010b000e 0x0200001d
>> +                /* TAB     F3         T          F6      */
>> +                0x0201000f 0x0202003d 0x02030014 0x02040040
>> +                /* ]       Y          102ND      [       */
>> +                0x0205001b 0x02060015 0x02070056 0x0208001a
>> +                /* F8      GRAVE      F2         5       */
>> +                0x02090042 0x03010029 0x0302003c 0x03030006
>> +                /* F5      6          -          \       */
>> +                0x0304003f 0x03060007 0x0308000c 0x030b002b
>> +                /* R_CTRL  A          D          F       */
>> +                0x04000061 0x0401001e 0x04020020 0x04030021
>> +                /* S       K          J          ;       */
>> +                0x0404001f 0x04050025 0x04060024 0x04080027
>> +                /* L       ENTER      Z          C       */
>> +                0x04090026 0x040b001c 0x0501002c 0x0502002e
>> +                /* V       X          ,          M       */
>> +                0x0503002f 0x0504002d 0x05050033 0x05060032
>> +                /* L_SHIFT /          .          SPACE   */
>> +                0x0507002a 0x05080035 0x05090034 0x050B0039
>> +                /* 1       3          4          2       */
>> +                0x06010002 0x06020004 0x06030005 0x06040003
>> +                /* 8       7          0          9       */
>> +                0x06050009 0x06060008 0x0608000b 0x0609000a
>> +                /* L_ALT   DOWN       RIGHT      Q       */
>> +                0x060a0038 0x060b006c 0x060c006a 0x07010010
>> +                /* E       R          W          I       */
>> +                0x07020012 0x07030013 0x07040011 0x07050017
>> +                /* U       R_SHIFT    P          O       */
>> +                0x07060016 0x07070036 0x07080019 0x07090018
>> +                /* UP      LEFT    */
>> +                0x070b0067 0x070c0069>;
>> +    };
>> +...
>> -- 
>> 2.17.1
>>
