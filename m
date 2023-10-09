Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06B707BE63A
	for <lists+linux-input@lfdr.de>; Mon,  9 Oct 2023 18:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344542AbjJIQVL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Oct 2023 12:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346636AbjJIQVK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Oct 2023 12:21:10 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8DCAC
        for <linux-input@vger.kernel.org>; Mon,  9 Oct 2023 09:21:09 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45968C433C7;
        Mon,  9 Oct 2023 16:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696868469;
        bh=O+CpNqRt0P0QSThDKZt7Zfl0padZ2Q61mgM0eDkq4Co=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X+OtNIrz44vZQfoTvmyAgUBWBWSm0UuHywY9ovT7YI2ug0RCOQoid6NlbRdiHXZ7s
         asyPW2+REAEVUiYDZR8zAQDAHdlYcjw3wMAFaT/mlYGZNGghV9aK1T2BqoNer8A3oy
         JldlnXuwihW/ED52gYsxT35b12dQquHo1J41t1CcmvrqkOTU9qI1x5RbFpIVKy3Jie
         BxNrbPnx+INvAVSYSUato/u7+OmCy/wqoJqYoXCANChL3E/8R5qXuYpZzQI/06Xtdj
         o9nhWUyseGY2qyfP4ADqzkGMmCIIAsmpmqQklI8NwrDcwVUnlKpotjsCUx+Lu24svK
         93N/kkXd/bNCw==
Date:   Mon, 9 Oct 2023 17:21:04 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Anshul Dalal <anshulusr@gmail.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v3 1/2] dt-bindings: input: bindings for Adafruit Seesaw
 Gamepad
Message-ID: <20231009-clatter-latrine-f6f9cd6f43c1@spud>
References: <20231008185709.2448423-1-anshulusr@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RH3Li9Lh/V1Q4IoS"
Content-Disposition: inline
In-Reply-To: <20231008185709.2448423-1-anshulusr@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--RH3Li9Lh/V1Q4IoS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2023 at 12:27:06AM +0530, Anshul Dalal wrote:
> A simple driver for a mini gamepad that communicates over i2c, the gamepad
> has bidirectional thumb stick input and six buttons.
>=20
> The gamepad chip utilizes the open framework from Adafruit called 'Seesaw'
> to transmit the ADC data for the joystick and digital pin state for the
> buttons. I have only implemented the functionality required to receive the
> thumb stick and button state.
>=20
> Product page:
>   https://www.adafruit.com/product/5743
> Arduino driver:
>   https://github.com/adafruit/Adafruit_Seesaw
>=20
> For testing on a RPi Zero 2W, I utilized the following devicetree overlay:
>=20
> /dts-v1/;
> /plugin/;
> / {
> 	compatible =3D "brcm,bcm2835";
> 	fragment@0 {
> 		target =3D <&i2c1>;
> 		__overlay__ {
> 			#address-cells =3D <1>;
> 			#size-cells =3D <0>;
> 			joystick@50 {
> 				compatible =3D "adafruit,seesaw-gamepad";
> 				reg =3D <0x50>;
> 			};
> 		};
> 	};
> };
>=20
> I used the above overlay as reference for writing this binding. Though the
> gamepad also has an interrupt pin that needs to be enabled explicitly (not
> currently implemented in driver). The pin triggers a rising edge when a
> button is pressed or joystick is moved which can be detected on a GPIO
> of the Microcontroller.
>=20
> I wasn't sure how to represent that functionality in the binding so I have
> left it out for now.
>=20
> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
> ---
>=20
> Changes for v3:
> - Updated id field to reflect updated file name from previous version
> - Added `reg` property
>=20
> Changes for v2:
> - Renamed file to `adafruit,seesaw-gamepad.yaml`
> - Removed quotes for `$id` and `$schema`
> - Removed "Bindings for" from the description
> - Changed node name to the generic name "joystick"
> - Changed compatible to 'adafruit,seesaw-gamepad' instead of 'adafruit,se=
esaw_gamepad'
>=20
>  .../input/adafruit,seesaw-gamepad.yaml        | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/adafruit,sees=
aw-gamepad.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/input/adafruit,seesaw-game=
pad.yaml b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.=
yaml
> new file mode 100644
> index 000000000000..610c99594439
> --- /dev/null

> +++ b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml

> +$id: http://devicetree.org/schemas/input/adafruit-seesaw.yaml#

You're at version 3 now, but do not seem to have figured out how to test
the bindings?
https://docs.kernel.org/devicetree/bindings/writing-schema.html#running-che=
cks

Thanks,
Conor.

--RH3Li9Lh/V1Q4IoS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSQocAAKCRB4tDGHoIJi
0i43AQCqkiPeSEJES0fFo407YP08/wBBsy0ymO0tWtBAoy27oAD+J091/NTFD2BM
sxEFSte4EAQlQQDufLxbP1XreMb3HgM=
=ODF5
-----END PGP SIGNATURE-----

--RH3Li9Lh/V1Q4IoS--
